#!/usr/bin/python3
#
# bmsw_graph_lib.py
#
# (c) 01_01_2026 philipp.freimann@bms-w.ch
#    (with help of gemini.google.com)
#    src: https://www.github.com/pheek/pyPlotLib
# Das Schweizer Koordinatensystem hat Pfeile, die über das Gitter hinausragen,
# was beim standard-Plot (mathplotilb/gnuplot/geogebra) nicht der Fall ist.
#
# Mit dieser Library sind möglich:
#   Funktionen
#   Texte
#   Linien
#   Punkte
#   Dann folgende Diagramm-Arten:
#     * Bar-Chart
#     * Histogramm
#     * Boxplot
#   Beim Boxplot beachten, dass "show_y_axis=False" gesetzt werden muss, denn
#   beim Boxplot macht die y-Achse keinen Sinn.
#


import matplotlib.pyplot     as     plt
import numpy                 as     np
from   matplotlib.ticker     import MultipleLocator, FuncFormatter
from   matplotlib.transforms import offset_copy
from   matplotlib.patches    import Polygon

# für Filenamen Erkennung
import sys
from   pathlib               import Path

##
# Globale BMS-W Farbe
#
BMSW_COLOR="#9C2F30"

##
# class BmsGraphLib
# import and use as in the /examples/
#

class BmswGraphLib:
	## attributes:
	# fig: figure
	# ax : axes

	##
  # Konstruktor
	def __init__(self):
		self.base_fontsize = 12  # Standard-Schriftgröße
		# Delegation an NumPy für Vektorfähigkeit
		self.log   = np.log
		self.log10 = np.log10
		self.sin   = np.sin
		self.cos   = np.cos
		self.tan   = np.tan
		self.sqrt  = np.sqrt # Überschreibt deine x**0.5 Version mit der schnelleren np-Variante
		self.exp   = np.exp
		self.pi    = np.pi

	def set_fontsize(self, size):
		""" Setzt die globale Schriftgröße für alle Elemente. """
		self.base_fontsize = size

	##
	# bmsw Koordinatensystem
	# Abgesehen vom Kreisdiagramm sollte immer ein Koordinatensystem
	# zugrunde liegen.
	# x_min, ... geben den Ausschnitt im kartesischen Koordinatensystem an.
	# show_y_axis sollte beim Boxplot auf False gesetzt werden.
	#

	def draw_system(self, x_min, x_max, y_min, y_max, show_y_axis=True, trig=False, step_x=1.0, step_y=1.0, grid_x=None, grid_y=None, figsize=(10,8)):
		"""
		Factory-Methode: Erstellt das System basierend auf dem Modus (Standard oder Trig).
		"""
		self.fig, self.ax = plt.subplots(figsize=figsize)

		# Entscheidung, welche Logik genutzt wird
		if trig:
			impl = _BmswTrigImpl(self)
		else:
			impl = _BmswStandardImpl(self, step_x=step_x, step_y=step_y, grid_x=grid_x, grid_y=grid_y)

		impl.setup(x_min, x_max, y_min, y_max, show_y_axis)

# END bmswCoordinateSystem


	##
	# Schreibe einen Text
	def text(self, x, y, label, color=BMSW_COLOR, fontweight='bold',ha='center', rotation=0):
		self.ax.text(x, y, label, color=color, fontsize=self.base_fontsize, fontweight=fontweight, ha=ha, rotation=rotation)


	##
	# Zeichne eine Markierung (dot, cross, ...
	# Dies ist eine simple Weiterleitung an "ax.plot()"
	def dot(self, *args, **kwargs):
		"""
		Zeichnet einen Punkt. Standardmäßig ein schwarzer Kreis ('ko').
		Gibt das erzeugte Line2D-Objekt zurück.
		"""
		if len(args) == 2:
			# Hier das return nutzen, um das Matplotlib-Objekt durchzureichen
			return self.ax.plot(*args, 'ko', **kwargs)
		return self.ax.plot(*args, **kwargs)



	##
	# Beschrifteter Punkt
	def labeled_dot(self, x, y, label, color=BMSW_COLOR, offset=(0.2, 0.1)):
		self.dot(x, y, 'o', color=color) # Punkt
		self.text(x + offset[0], y + offset[1], label, color=color, ha='left')

	##
	# Zeichnen von Funktionen
	# Am einfachsten geht das mit lambda-Funktionen:
	# # draw_function_into_system(ax, lambda x: 0.5 * x**2 - 2, (-3.5, 3.5), label="Parabel", color='#33ddee')
	# ax     : Achse aus dem Koordinatensystem
	# func   : Die zu zeichnende Funktion
	# x_range: Definitionsbereich
	# label  : Beschriftung (optional)
	# color  : Farbe (optional)
	def draw_function_into_system(self, func, x_range, label=None, color=BMSW_COLOR):
		"""
		Zeichnet eine mathematische Funktion in das System ein.
		func: Eine Lambda-Funktion oder normale Funktion
		x_range: Ein Tupel (start, ende)
		"""
		x = np.linspace(x_range[0], x_range[1], 400)

		with np.errstate(all='ignore'):
			v_func = np.vectorize(func)
			try:
				y = func(x)
			except (TypeError, ValueError):
				y = v_func(x)

		line, = self.ax.plot(x, y, linewidth=2, label=label, color=color, zorder=2)

		return line


	##
	# Draw Polygon
	def draw_polygon(self, points, color=BMSW_COLOR, label=None):
		"""
		Zeichnet ein geschlossenes, gefülltes Polygon.
		points: Liste von Koordinaten-Paaren, z. B. [[x1, y1], [x2, y2], ...]
		color: Die Hauptfarbe für Rand und Fläche (Fläche erhält 20% Opazität)
		"""
		# 20% Opazität für die Fläche (Hex '33')
		fill_color = f"{color}33" if color.startswith('#') else color

		# Das Polygon-Objekt erstellen
		# closed=True sorgt dafür, dass der letzte Punkt mit dem ersten verbunden wird
		poly = Polygon(points, closed=True,
		               facecolor=fill_color,
		               edgecolor=color,
		               linewidth=2,
		               zorder=3,
		               label=label)

		self.ax.add_patch(poly)
		return poly


	##
	# Ein Bar-Chart als "Säulendiagramm"
	# mit "set_custom_labels" können die Säulen einzeln beschriftet werden.
	# siehe folder /examples/
	#
	def draw_bar_chart(self, x_values, y_values, label=None, color=BMSW_COLOR, width=0.8, withNumbers=True, number_shift=0.5):
		"""
		Zeichnet ein Säulendiagramm in das bestehende System.
		width=1.0 würde bedeuten, dass die Säulen einander berühren.
		"""
		# align='edge' setzt die linke Kante der Säule auf den x-Wert.
		# align='center' (Standard) setzt die Mitte der Säule auf den x-Wert.
		bars = self.ax.bar(x_values, y_values,
		                   width=width,
		                   color=color,
		                   label=label,
		                   edgecolor='black',
		                   linewidth=1,
		                   zorder=3)
		if withNumbers:
			for i, value in enumerate(y_values):
				self.ax.text(x_values[i], value + number_shift, str(value), ha='center', va='bottom', fontsize=self.base_fontsize)
		return bars


	##
	# Eigene Beschritfungen für draw_bar_chart()
	#
	def set_custom_labels(self, x_values, labels):
		"""
		Ersetzt die Zahlen an der x-Achse durch Text-Labels.
		x_values: Die Positionen (z. B. [1, 2, 3])
		labels: Die Texte (z. B. ['S', 'M', 'L'])
		"""
		self.ax.set_xticks(x_values)
		self.ax.set_xticklabels(labels, fontweight='bold', fontsize=self.base_fontsize + 2)


	def set_trig_labels(self):
		# Beispielhaft für ein System von -pi bis pi
		positions = [-np.pi, -np.pi/2, 0, np.pi/2, np.pi, 1.5*np.pi, 2*np.pi]
		labels = [r'$-\pi$', r'$-\frac{\pi}{2}$', '0', r'$\frac{\pi}{2}$', r'$\pi$', r'$\frac{3\pi}{2}$', r'$2\pi$']
		self.set_custom_labels(positions, labels)


	##
	# Ein Histogramm
	#
	def draw_histogram(self, data, bin_width, start_value, label=None, color=BMSW_COLOR):
		"""
		Zeichnet ein Histogramm mit fester Säulenbreite und definiertem Startwert.
		data: Die Liste der Rohdaten (z. B. [1.2, 1.5, 2.3, 2.7, ...])
		bin_width: Breite einer Säule (z. B. 1.0)
		start_value: Wo die erste Säule beginnen soll
		"""
		# Berechne die Klassengrenzen (Bins) basierend auf den Daten
		max_val = max(data) if data else start_value
		bins = np.arange(start_value, max_val + bin_width + 1, bin_width)

		# Histogramm zeichnen
		# edgecolor='black' sorgt für die Trennung der Säulen (Schulbuch-Stil)
		n, bins, patches = self.ax.hist(data,
		                                bins=bins,
		                                color=color,
		                                label=label,
		                                edgecolor='black',
		                                linewidth=1,
		                                zorder=3,
		                                alpha=0.8)
		return n, bins


	##
	# Boxplot
	#
	def draw_boxplot(self, data, y_position, height=1.45, label=None, color=BMSW_COLOR, axis_label=None):
		"""
		Zeichnet einen horizontalen Boxplot mit massiv verstärkten Linien und Ausreißern.
		"""
		# Hintergrundfarbe mit Transparenz
		fill_color = f"{color}4D" if color.startswith('#') else "#cccccccc"
		
		# Verstärkte Linienstärken (ca. 3x so breit wie vorher)
		line_width_bold = 4.5  # Vorher ca. 1.5 bis 2.5
		
		bp = self.ax.boxplot(data,
		                     vert=False,
		                     positions=[y_position], 
		                     widths=height,
		                     patch_artist=True, 
		                     manage_ticks=False,
		                     # Die Box selbst
		                     boxprops=dict(facecolor=fill_color, color=color, linewidth=line_width_bold),
		                     # Der Median (der dicke Strich in der Mitte)
		                     medianprops=dict(color=color, linewidth=line_width_bold * 1.5),
		                     # Die Whisker (Antennen)
		                     whiskerprops=dict(color=color, linewidth=line_width_bold),
		                     # Die Endstriche der Whisker
		                     capprops=dict(color=color, linewidth=line_width_bold),
		                     # NEU: Die Ausreißer (flierprops) massiv vergrößern
		                     flierprops=dict(marker='o', markerfacecolor='none', 
		                                     markeredgecolor=color, markersize=12, 
		                                     markeredgewidth=4),
		                     zorder=4)

		# Optionales Label
		if label:
			self.ax.text(min(data) - 0.5, y_position, label, fontweight='bold', 
			             va='center', ha='right', fontsize=self.base_fontsize)
		
		# Achsen-Beschriftung
		if axis_label:
			self.ax.set_xlabel(axis_label, fontweight='bold', 
			                   fontsize=self.base_fontsize, labelpad=15)
		return bp

	# Unahbhängig vom Koordinatensystem:
	# mögliche modi: "none", "relativ", "absolute"
	# Wichtig: die "captions" und die "values" müssen gleich
	#          viele Anzahl Werte aufweisen.
	#
	def draw_pie_chart(self, captions, values, mode="none", title=None, colors=None):
		"""
		Erstellt ein Kreisdiagramm und fängt den Rückgabewert-Fehler ab.
		"""
		if colors is None:
			colors = [
			          '#aed6f1', # Hellblau
			          '#abebc6', # Hellgrün
			          '#fad7a0', # Hellorange
			          '#f9ebae', # Hellgelb
			          '#d2b4de', # Hellviolett
			          '#a2d9ce', # Helltürkis
			          '#edbb99', # Pfirsich
			          '#d5dbdb', # Hellgrau
			          '#f5b7b1', # Hellrot/Rosa
			          '#ebdef0'  # Flieder
			         ]

		self.fig, self.ax = plt.subplots(figsize=(8, 8))

		# Logik für die Beschriftung im Kreis
		if mode == "relativ":
			autopct_format = '%1.1f%%'
		elif mode == "absolute":
			total = sum(values)
			autopct_format = lambda p: f'{p * total / 100 :.0f}'
		else:
			autopct_format = None

		# --- Die Lösung für den ValueError ---
		results = self.ax.pie(
		                     values,
		                     labels=captions,
		                     autopct=autopct_format,
		                     startangle=90,
		                     colors=colors,
		                     radius=0.8,
		                     pctdistance=0.7,
		                     explode=[0.02] * len(values),
		                     labeldistance=1.15,
		                     textprops={'fontweight': 'bold', 'fontsize': self.base_fontsize+2}
		                    )

		# Entpacken je nach Modus
		if autopct_format is not None:
			wedges, texts, autotexts = results
			# Styling der Beschriftungen im Kreis
			plt.setp(autotexts, size=18, color="black", fontweight='bold')
		else:
			wedges, texts = results

		if title:
			self.ax.set_title(title, fontsize=self.base_fontsize+4, fontweight='bold', pad=20)

		self.ax.axis('equal')



	## draw legend (muss noch klarer sein, wo genau zu zeichnen)
	# mögliche Werte:
	# loc = "upper right"
	# loc = "center righ"
	# loc = "center left"
	# loc = "lower right"
	# loc = "lower center"
	# loc = "center"
	def legend(self, *args, **hargs):
		"""
		Zeigt die Legende an und nutzt automatisch die globale base_fontsize.
		"""
		# Debug-Print: Wenn der nicht kommt, wird die Methode nicht aufgerufen!
		print(f"DEBUG: Legend Methode der Klasse aufgerufen mit Size {self.base_fontsize}")

		if 'fontsize' not in hargs:
			hargs['fontsize'] = self.base_fontsize

		if 'prop' not in hargs:
			hargs['prop'] = {'size': self.base_fontsize}
		elif 'size' not in hargs['prop']:
			hargs['prop']['size'] = self.base_fontsize

		self.ax.legend(*args, **hargs)


	##
	# Jedes Bild kann mit
	#  save_system(fig, "meinbild.png")
	# oder mit
	#  save_system(fig, "meinbild.svg") (oder .eps / .pdf)
	# gespeichert werden.
	# mit plt.show() wird es jeweils am Ende angezeigt.
	def save_system(self, filename, dpi=600):
		"""
		Speichert die Grafik in hoher Qualität.
		.png -> Rastergrafik (gut für Word/Web)
		.eps oder .pdf -> Vektorgrafik (perfekt für LaTeX/Druck, unendlich skalierbar)
		"""
		# bbox_inches='tight' sorgt dafür, dass die Achsenbeschriftungen
		# nicht abgeschnitten werden.

		if(len(filename) < 4):
			filename = Path(sys.argv[0]).stem + "." + filename

		self.fig.savefig(filename, dpi=dpi, bbox_inches='tight', transparent=False)
		print(f"Grafik erfolgreich als {filename} gespeichert.")


	## show
	# Anzeigen der Graphik in neuem Fenster
	def show(self):
		plt.show()

# end class BmswGrapLib



#############################################################################

class _BmswBaseImpl:
	""" Basis-Logik für das Schweizer Koordinatensystem. """
	def __init__(self, parent):
		self.p = parent

	def setup(self, x_min, x_max, y_min, y_max, show_y_axis):
		puffer = 0.7
		self.p.ax.set_xlim(x_min - puffer, x_max + puffer)
		self.p.ax.set_ylim(y_min - puffer, y_max + puffer)
		self.p.ax.spines['bottom'].set_position('zero')

		if show_y_axis:
			self.p.ax.spines['left'].set_position('zero')
		else:
			self.p.ax.spines['left'].set_color('none')

		self.p.ax.spines['right'].set_color('none')
		self.p.ax.spines['top'].set_color('none')

		self.draw_grid(x_min, x_max, y_min, y_max)
		self.setup_ticks(x_min, x_max, y_min, y_max, show_y_axis)
		self.draw_arrows(x_max, y_max, show_y_axis, puffer)

	def draw_arrows(self, x_max, y_max, show_y_axis, puffer):
		# X-Achse
		self.p.ax.plot(x_max + puffer, 0, ">k", clip_on=False, zorder=5)
		x_off = offset_copy(self.p.ax.transData, fig=self.p.fig, x=0, y=-4, units='points')
		self.p.ax.text(x_max + puffer, 0, self.get_x_name(), fontsize=self.p.base_fontsize+2, fontweight='bold', ha='center', va='top', transform=x_off)
		# Y-Achse
		if show_y_axis:
			self.p.ax.plot(0, y_max + puffer, "^k", clip_on=False, zorder=5)
			y_off = offset_copy(self.p.ax.transData, fig=self.p.fig, x=4, y=3, units='points')
			self.p.ax.text(0, y_max + puffer, 'y', fontsize=self.p.base_fontsize+2, fontweight='bold', va='center', transform=y_off)


##############################################################################

class _BmswStandardImpl(_BmswBaseImpl):
	def get_x_name(self): return "x"

	def __init__(self, parent, step_x=1.0, step_y=1.0, grid_x=None, grid_y=None):
		super().__init__(parent)
		self.step_x = step_x
		self.step_y = step_y
		# Intelligente Standardwerte für das Gitter, falls nichts angegeben wurde:
		# Wenn Schrittweite 5 ist -> Gitterweite 1
		# Wenn Schrittweite 10 ist -> Gitterweite 2 oder 5 (hier wählen wir 2 für mehr Details)
		# Sonst einfach die Hälfte der Schrittweite
		self.grid_x = grid_x if grid_x is not None else (1.0 if step_x == 5.0 else step_x * 0.5)
		self.grid_y = grid_y if grid_y is not None else (1.0 if step_y == 5.0 else step_y * 0.5)

	def draw_grid(self, x_min, x_max, y_min, y_max):
		# Hilfsfunktion zum Einrasten auf das nächste Vielfache
		def get_clean_start(start, step):
			return np.ceil(start / step) * step

		# 1. Feines Gitter (Minor)
		x_start_minor = get_clean_start(x_min, self.grid_x)
		for x in np.arange(x_start_minor, x_max + 0.01, self.grid_x):
			self.p.ax.plot([x, x], [y_min, y_max], color='#d0d0f0', lw=0.5, zorder=0)
		
		y_start_minor = get_clean_start(y_min, self.grid_y)
		for y in np.arange(y_start_minor, y_max + 0.01, self.grid_y):
			self.p.ax.plot([x_min, x_max], [y, y], color='#d0d0f0', lw=0.5, zorder=0)
		
		# 2. Hauptgitter (Major - korrespondierend zu den Zahlen)
		x_start_major = get_clean_start(x_min, self.step_x)
		for x in np.arange(x_start_major, x_max + 0.01, self.step_x):
			self.p.ax.plot([x, x], [y_min, y_max], color='#9090c0', lw=0.8, zorder=0)
			
		y_start_major = get_clean_start(y_min, self.step_y)
		for y in np.arange(y_start_major, y_max + 0.01, self.step_y):
			self.p.ax.plot([x_min, x_max], [y, y], color='#9090c0', lw=0.8, zorder=0)

	def setup_ticks(self, x_min, x_max, y_min, y_max, show_y_axis):
		from matplotlib.ticker import MultipleLocator
        
		self.p.ax.xaxis.set_major_locator(MultipleLocator(self.step_x))
		# Schriftgröße für X- und Y-Achse (Zahlen) anpassen
		self.p.ax.tick_params(axis='both', which='major', labelsize=self.p.base_fontsize)

		self.p.ax.xaxis.set_major_formatter(FuncFormatter(
			lambda v, p: f'{v:g}' if x_min <= v <= x_max else ''
		))

		# Y-Achse
		if show_y_axis:
			y_ticks = np.arange(y_min, y_max + 0.1, 1.0)
			#self.p.ax.set_yticks(y_ticks)
			self.p.ax.yaxis.set_major_locator(MultipleLocator(self.step_y))
			self.p.ax.yaxis.set_major_formatter(FuncFormatter(
				lambda v, p: '' if np.isclose(v, 0) or v < y_min or v > y_max else f'{v:g}'
			))
		else:
			self.p.ax.set_yticks([])
			self.p.ax.yaxis.set_major_formatter(plt.NullFormatter())


class _BmswTrigImpl(_BmswBaseImpl):
	def get_x_name(self): return r"$\varphi$"

	def draw_grid(self, x_min, x_max, y_min, y_max):
		# Hilfsfunktion für "saubere" Gitterstarts (verhindert Verschiebung)
		def get_clean_range(start, end, step):
			first_tick = np.ceil(start / step) * step
			return np.arange(first_tick, end + 0.01, step)

		# Vertikale Linien (Winkel)
		# 30° Minor (sehr fein)
		for x in get_clean_range(x_min, x_max, np.pi/6):
			self.p.ax.plot([x, x], [y_min, y_max], color='#f0f0f8', lw=0.4, zorder=0)
		# 90° Major (etwas kräftiger)
		for x in get_clean_range(x_min, x_max, np.pi/2):
			self.p.ax.plot([x, x], [y_min, y_max], color='#e0e0f5', lw=0.7, zorder=0)

		# Horizontale Linien (Y-Werte) - Diese fehlten!
		# Wir nutzen hier die Standard-Schritte (1.0 und 0.5), da y meist linear bleibt
		for y in np.arange(np.floor(y_min), y_max + 0.01, 0.5):
			self.p.ax.plot([x_min, x_max], [y, y], color='#f0f0f8', lw=0.4, zorder=0)
		for y in np.arange(np.floor(y_min), y_max + 0.01, 1.0):
			self.p.ax.plot([x_min, x_max], [y, y], color='#e0e0f5', lw=0.7, zorder=0)

	def setup_ticks(self, x_min, x_max, y_min, y_max, show_y_axis):
		# X-Achse (Winkel)
		start_x = np.ceil(x_min / (np.pi/2)) * (np.pi/2)
		positions = np.arange(start_x, x_max + 0.01, np.pi/2)
		labels = [self._make_pi_label(p) for p in positions]
		self.p.ax.set_xticks(positions)
		# Hier hast du es schon richtig gemacht:
		self.p.ax.set_xticklabels(labels, fontsize=self.p.base_fontsize, fontweight='bold')

		# Y-Achse (Zahlen)
		if show_y_axis:
			y_ticks = np.arange(np.ceil(y_min), np.floor(y_max) + 0.1, 1.0)
			self.p.ax.set_yticks(y_ticks)
			# NEU: Auch hier die Schriftgröße für die Y-Zahlen setzen
			self.p.ax.tick_params(axis='y', labelsize=self.p.base_fontsize)
			self.p.ax.yaxis.set_major_formatter(FuncFormatter(
				lambda v, p: '' if np.isclose(v, 0) or v < y_min or v > y_max else f'{v:g}'
			))
		else:
			self.p.ax.set_yticks([])

	def _make_pi_label(self, val):
		if np.isclose(val, 0): return '0'
		if np.isclose(val, np.pi): return r'$\pi$'
		if np.isclose(val, -np.pi): return r'$-\pi$'
		# Vereinfachte Brüche (z.B. pi/2)
		frac = val / np.pi
		return r'$%.1f\pi$' % frac




## create a global instance
b = BmswGraphLib()



##
# Demo: draw a simple graph
def demo():
	# b = BmswGraphLib() # b already globally defined
	b.set_fontsize(15)

	## always start with a system (except draw_pie_chart())
	b.draw_system(-2.5, 2.5, -4, 3.5)

	## any function-graph
	b.draw_function_into_system(lambda x: -0.3 * x**2 + 2*x + 1, (-2, 1.5), label="Parabel 2")

	## a box-plot
	boxplotdaten = [0.1, 0.2,0.2, 0.2,0.3,1.3,0.4,0.4,1.1, 0.9, 0.5, 0.5, 0.5, 0.6, 0.7, 0.9, 2.2]
	b.draw_boxplot(boxplotdaten, -1.5, height=0.8)

	bar_pos=[0.5, 1, 1.5, 2]
	bar_val=[  6, 4,   1, 3]

	# barchart
	b.draw_bar_chart(bar_pos, bar_val, width=0.3)

	#lables / texts
	b.labeled_dot(-2, 2, r'$P=({-2}|2)$')

	b.text(-2.5, 1, r'Werte $\longrightarrow$', color='#0000ff', rotation=90)

	#polygon
	dreieck_punkte = [[-2, 0], [-1, 0], [-2, 2]]

	# C 2. Zeichnen
	b.draw_polygon(dreieck_punkte, color='#8e44ff', label="Fläche A")

	b.legend(loc="lower right")

	b.show()
#	b.save_system("png") # optional



## #####################################
## start Main_ bmsw_graph_lib.py
# shows a little demo
if "__main__" == __name__:
	demo()
