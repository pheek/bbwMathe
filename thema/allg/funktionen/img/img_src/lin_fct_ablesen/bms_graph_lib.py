# bms_graph_lib.py
#
# (c) 01_01_2026 philipp.freimann@bms-w.ch
#    (with help of gemini.google.com)
#    src: https://www.github.com/pheek/pyPlotLib
# Das Schweizer Koordinatensystem hat Pfeile, die über das Gitter hinausragen,
# was beim standard-Plott (mathplotilb/gnuplot/geogebra) nicht der Fall ist.
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
##
# bmsw Koordinatensystem
# Abgesehen vom Kreisdiagramm sollte immer ein Koordinatensystem
# zugrunde liegen.
# x_min, ... geben den Ausschnitt im kartesischen Koordinatensystem an.
# show_y_axis sollte beim Boxplot auf False gesetzt werden.
#

def bmsw_coordinate_system(x_min, x_max, y_min, y_max, show_y_axis=True):
    """
    Erstellt ein Schweizer Koordinatensystem mit hierarchischem Gitter.
    show_y_axis=False blendet die y-Achse und deren Beschriftung für Boxplots aus.
    """
    fig, ax = plt.subplots(figsize=(10, 8))

    # 1. Achsen-Limits (Puffer für Pfeile)
    ax.set_xlim(x_min - 1, x_max + 1)
    ax.set_ylim(y_min - 1, y_max + 1)

    # 2. Achsen zentrieren (Spines)
    ax.spines['bottom'].set_position('zero')
    if show_y_axis:
        ax.spines['left'].set_position('zero')
    else:
        ax.spines['left'].set_color('none')
    
    ax.spines['right'].set_color('none')
    ax.spines['top'].set_color('none')

    # 3. Dynamische Gitter-Intervalle
    width_x = x_max - x_min
    major_step = 5 if width_x > 20 else 1
    minor_step = 1 if width_x > 20 else 0.5

    # 4. Gitter zeichnen (begrenzt auf x_min/max und y_min/max)
    # Feines Gitter
    m_x = np.arange(x_min, x_max + 0.01, minor_step)
    m_y = np.arange(y_min, y_max + 0.01, minor_step)
    for x in m_x:
        ax.plot([x, x], [y_min, y_max], color='#d0d0f0', linewidth=0.5, zorder=0)
    for y in m_y:
        ax.plot([x_min, x_max], [y, y], color='#d0d0f0', linewidth=0.5, zorder=0)

    # Hauptgitter
    M_x = np.arange(x_min, x_max + 0.01, major_step)
    M_y = np.arange(y_min, y_max + 0.01, major_step)
    for x in M_x:
        ax.plot([x, x], [y_min, y_max], color='#9090c0', linewidth=0.8, zorder=0)
    for y in M_y:
        ax.plot([x_min, x_max], [y, y], color='#9090c0', linewidth=0.8, zorder=0)

    # 5. Ticks & Formatter (Zahlen)
    ax.xaxis.set_major_locator(MultipleLocator(major_step))
    
    # Formatter für die X-Achse (blendet Randzahlen aus)
    def x_formatter(val, pos):
        if np.isclose(val, x_min-1) or np.isclose(val, x_max+1): return ''
        return f'{val:g}'
    ax.xaxis.set_major_formatter(FuncFormatter(x_formatter))

    if show_y_axis:
        ax.yaxis.set_major_locator(MultipleLocator(major_step))
        def y_formatter(val, pos):
            if np.isclose(val, y_min-1) or np.isclose(val, y_max+1): return ''
            return f'{val:g}'
        ax.yaxis.set_major_formatter(FuncFormatter(y_formatter))
    else:
        ax.yaxis.set_major_locator(plt.NullLocator())

    # Styling: Keine Strichlein (Ticks), nur Zahlen
    ax.tick_params(axis='both', which='both', length=0, labelsize=11)
    
    # Fontweight Bold für alle Achsenbeschriftungen
    fig.canvas.draw()
    plt.setp(ax.get_xticklabels(), fontweight='bold')
    if show_y_axis:
        plt.setp(ax.get_yticklabels(), fontweight='bold')

    # 6. Pfeile und Beschriftung
    # X-Achse (immer vorhanden)
    ax.plot(x_max + 1, 0, ">k", clip_on=False, zorder=5)
    x_offset = offset_copy(ax.transData, fig=fig, x=0, y=-4, units='points')
    ax.text(x_max + 1, 0, 'x', fontsize=14, fontweight='bold', ha='center', va='top', transform=x_offset)

    # Y-Achse (nur wenn gewünscht)
    if show_y_axis:
        ax.plot(0, y_max + 1, "^k", clip_on=False, zorder=5)
        y_offset = offset_copy(ax.transData, fig=fig, x=4, y=3, units='points')
        ax.text(0, y_max + 1, 'y', fontsize=14, fontweight='bold', va='center', transform=y_offset)

    ax.set_aspect('equal')
    return fig, ax


##
# Jedes Bild kann mit
#  save_system(fig, "meinbild.png")
# oder mit
#  save_system(fig, "meinbild.svg") (oder .eps / .pdf)
# gespeichert werden.
# mit plt.show() wird es jeweils am Ende angezeigt.
def save_system(fig, filename, dpi=300):
    """
    Speichert die Grafik in hoher Qualität.
    .png -> Rastergrafik (gut für Word/Web)
    .eps oder .pdf -> Vektorgrafik (perfekt für LaTeX/Druck, unendlich skalierbar)
    """
    # bbox_inches='tight' sorgt dafür, dass die Achsenbeschriftungen 
    # nicht abgeschnitten werden.
    fig.savefig(filename, dpi=dpi, bbox_inches='tight', transparent=False)
    print(f"Grafik erfolgreich als {filename} gespeichert.")


##
# Zeichnen von Funktionen
# Am einfachsten geht das mit lambda-Funktionen:
# # draw_function_into_system(ax, lambda x: 0.5 * x**2 - 2, (-3.5, 3.5), label="Parabel", color='#33ddee')
# ax     : Achse aus dem Koordinatensystem
# func   : Die zu zeichnende Funktion
# x_range: Definitionsbereich
# label  : Beschriftung (optional)
# color  : Farbe (optional)
def draw_function_into_system(ax, func, x_range, label=None, color=None):
    """
    Zeichnet eine mathematische Funktion in das System ein.
    func: Eine Lambda-Funktion oder normale Funktion
    x_range: Ein Tupel (start, ende)
    """
    x = np.linspace(x_range[0], x_range[1], 400)
    y = func(x)
    line, = ax.plot(x, y, linewidth=2, label=label, color=color)
    return line


##
# Draw Polygon
def draw_polygon(ax, points, color='#e74c3c', label=None):
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
    
    ax.add_patch(poly)
    
    return poly

##
# Ein Bar-Chart als "Säulendiagramm"
# mit "set_custom_labels" können die Säulen einzeln beschriftet werden.
# siehe folder /examples/
#
def draw_bar_chart(ax, x_values, y_values, label=None, color='#3498db', width=0.8):
    """
    Zeichnet ein Säulendiagramm in das bestehende System.
    width=1.0 würde bedeuten, dass die Säulen einander berühren.
    """
    # align='edge' setzt die linke Kante der Säule auf den x-Wert. 
    # align='center' (Standard) setzt die Mitte der Säule auf den x-Wert.
    bars = ax.bar(x_values, y_values, width=width, color=color, 
                  label=label, edgecolor='black', linewidth=1, zorder=3)    
    return bars

##
# Eigene Beschritfungen für draw_bar_chart()
#
def set_custom_labels(ax, x_values, labels):
    """
    Ersetzt die Zahlen an der x-Achse durch Text-Labels.
    x_values: Die Positionen (z. B. [1, 2, 3])
    labels: Die Texte (z. B. ['S', 'M', 'L'])
    """
    ax.set_xticks(x_values)
    ax.set_xticklabels(labels, fontweight='bold', fontsize=12)

##
# Ein Histogramm
#
def draw_histogram(ax, data, bin_width, start_value, label=None, color='#2ecc71'):
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
    n, bins, patches = ax.hist(data, bins=bins, color=color, label=label, 
                               edgecolor='black', linewidth=1, zorder=3, alpha=0.8)
    
    return n, bins

##
# Boxplot
# 
def draw_boxplot(ax, data, y_position, height=1.45, label=None, color='#3498db', axis_label=None):
    """
    Zeichnet einen horizontalen Boxplot in das System.
    data: Liste oder Array mit numerischen Werten.
    y_position: Die Höhe auf der y-Achse, auf welcher der Boxplot liegen soll.
    height: Die vertikale Ausdehnung der Box.
    """
    # Hintergrundfarbe
    fill_color = f"{color}4D" if color.startswith('#') else "#cccccccc"
    # patch_artist=True erlaubt das Füllen der Box mit Farbe
    # vert=False sorgt für die horizontale Ausrichtung
    # positions=[y_position] setzt den Boxplot auf die gewünschte Höhe
    bp = ax.boxplot(data, vert=False, positions=[y_position], widths=height,
                    patch_artist=True, manage_ticks=False,
                    boxprops=dict(facecolor=fill_color, color=color, linewidth=1.5),
                    medianprops=dict(color=color, linewidth=2.5), # Roter Median
                    whiskerprops=dict(color=color, linewidth=2.5),
                    capprops=dict(color=color, linewidth=1.5),
                    zorder=4)
    
    # Optionales Label links neben den Boxplot setzen
    if label:
        ax.text(min(data) - 0.5, y_position, label, 
                fontweight='bold', va='center', ha='right', fontsize=10)
    # Achsen-Beschriftung
    if axis_label:
        # Wir platzieren den Text unter der X-Achse (y-Position leicht negativ)
        # transform=ax.get_xaxis_transform() sorgt dafür, dass x in Daten-Koordinaten 
        # und y in Achsen-Koordinaten (0 bis 1) gemessen wird.
        ax.set_xlabel(axis_label, fontweight='bold', fontsize=12, labelpad=15)
        
    return bp


# Unahbhängig vom Koordinatensystem:
# mögliche modi: "none", "relativ", "absolute"
# Wichtig: die "captions" und die "values" müssen gleich
#          viele Anzahl Werte aufweisen.
#
def draw_pie_chart(captions, values, mode="none", title=None, colors=None):
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

    fig, ax = plt.subplots(figsize=(8, 8))
    
    # Logik für die Beschriftung im Kreis
    if mode == "relativ":
        autopct_format = '%1.1f%%'
    elif mode == "absolute":
        total = sum(values)
        autopct_format = lambda p: f'{p * total / 100 :.0f}'
    else:
        autopct_format = None

    # --- Die Lösung für den ValueError ---
    results = ax.pie(
        values, 
        labels=captions, 
        autopct=autopct_format, 
        startangle=90, 
        colors=colors,
        radius=0.8,
        pctdistance=0.7,
        explode=[0.02] * len(values),
        labeldistance=1.15,
        textprops={'fontweight': 'bold', 'fontsize': 14}
    )

    # Entpacken je nach Modus
    if autopct_format is not None:
        wedges, texts, autotexts = results
        # Styling der Beschriftungen im Kreis
        plt.setp(autotexts, size=18, color="black", fontweight='bold')
    else:
        wedges, texts = results

    if title:
        ax.set_title(title, fontsize=16, fontweight='bold', pad=20)

    ax.axis('equal')  
    return fig, ax
