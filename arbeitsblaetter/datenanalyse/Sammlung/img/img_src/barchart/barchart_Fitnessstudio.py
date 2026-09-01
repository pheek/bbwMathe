#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib


from bmsw_graph_lib import b

b.set_fontsize(20)

# 1. System erstellen 
b.draw_system(0, 6, 0, 40, step_y=10, step_x=1, grid_y=1, grid_x=1, figsize=(6, 8))

# 2. Daten definierensave_system(fig, "barchart1.png")

pos_x      = [1, 2, 3, 4, 5]
teilnehmer = ["Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]
anzahl     = [22, 6, 19, 32, 39]

# 3. Säulen zeichnen
b.draw_bar_chart(pos_x, anzahl)

# Iterate over the bars (patches) and add text labels
for i, value in enumerate(anzahl):
    # Position the text slightly above the top center of each bar
    b.ax.text(i+1, value + 0.5, str(value), ha='center', va='bottom', fontsize=20)



# 4. Namen statt Zahlen an die x-Achse schreiben
b.set_custom_labels(pos_x, teilnehmer)

#optional:
#evtl schief stellen
b.ax.set_xticklabels(teilnehmer, fontweight='bold', rotation=30, ha='right')

b.text(-1.2, 10, 'Anzahl Teilnehmende', rotation=90)

#b.legend(["Teilnehmer"], loc='center right')

## save (optional) and show
b.save_system("pdf")
b.show()
