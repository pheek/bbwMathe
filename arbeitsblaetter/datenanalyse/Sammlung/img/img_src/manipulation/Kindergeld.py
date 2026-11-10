#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib


from bmsw_graph_lib import b

# 1. System erstellen 
b.draw_system(0, 3, 0, 160, grid_x=1, step_x=1, grid_y=10, step_y=50)

# Wird set_fontsize vor "draw_system" aufgerufen, so
# werden auch die Achsenbeschriftungen vergrößert
b.set_fontsize(16)

# 2. Daten definierensave_system(fig, "barchart1.png")

pos_x = [1, 2, 3]
groessen = ["1998", "2000", "2002"]
anzahl = [112.48, 138.05, 154.00]

# 3. Säulen zeichnen
b.draw_bar_chart(pos_x, anzahl)

# 4. Namen statt Zahlen an die x-Achse schreiben
b.set_custom_labels(pos_x, groessen)

b.text(-0.5, 6, 'Kindergeld (Euro pro Monat)', color='#000000', rotation=90)

#optional:
#evtl schief stellen
b.ax.set_xticklabels(groessen, fontweight='bold', rotation=30, ha='right')

#b.legend(["Menusalate"], loc='upper center')

## save (optional) and show
b.save_system("png")
#b.show()
