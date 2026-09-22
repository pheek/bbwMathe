#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib


from bmsw_graph_lib import b

b.set_fontsize(20)

# 1. System erstellen 
#b.draw_system(0, 6, 0, 40, step_y=10, step_x=1, grid_y=1, grid_x=1, figsize=(6, 8))

# 2. Daten definierensave_system(fig, "barchart1.png")

#pos_x      = [1, 2, 3, 4, 5]
teilnehmer = ["Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]
anzahl     = [22, 6, 19, 32, 39]

# 3. Säulen zeichnen
b.draw_pie_chart(teilnehmer, anzahl, mode="absolute", title="Wochentage")
b.save_system("png")
b.show()
