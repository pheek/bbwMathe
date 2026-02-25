#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib


from bmsw_graph_lib import b

# A. System erstellen 
b.draw_system(-3, +3, -2, +5)

def parabelInScheitelform(x):
	return 4 - x*x

# B 1. Eine Parabel in Scheitelform
b.draw_function_into_system(parabelInScheitelform, (-2.5, 2.5), label="Parabel")


# C Polygon
# C 1. Punkte definieren (z.B. ein Parallelogramm)
rechteck_punkte = [[1, 0], [1, 3], [-1, 3], [-1,0]]

# C 2. Zeichnen
b.draw_polygon(rechteck_punkte, color='#8e44ff')


# E anzeigen und (optional) speichern
#b.save_system("png")
#b.save_system("eps")
# und anzeigen (optional, aber von Vorteil)
b.show()
