#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib

from bmsw_graph_lib import b

# optional: Font-Size vergrößern
#b.set_fontsize(20)

# A. System erstellen (z. B. x von -1 bis 4 und y von -4 bis 2)
b.draw_system(-1, 10, 0, 2, show_y_axis=False, figsize=(8, 1))

# Funktion definieren (-0.5 (x-2)^2 + 1.5
def f1(x):
	return 0*x + 0.5

def f2(x):
	return 0*x + 1.5

# Eine Parabel in Scheitelform im Definitionsbereich -0.5 bis 3.5
b.draw_function_into_system(f1, (0, 9.5))
b.dot(5  , 0.5, color='red')
b.dot(6  , 0.5, color='red')
b.dot(7  , 0.5, color='red')
b.dot(8  , 0.5, color='red')
b.dot(8.5, 0.5, color='red')


b.draw_function_into_system(f2, (0, 9.5), color='blue')
b.dot(1. , 1.5, color='blue')
b.dot(6  , 1.5, color='blue')
b.dot(7  , 1.5, color='blue')
b.dot(8  , 1.5, color='blue')
b.dot(8.5, 1.5, color='blue')

# Legende anzeigen (optional)
#b.legend(loc='lower center')

# anzeigen und (optional) speichern
#b.save_system("png")
b.save_system("eps")
#b.save_system("pdf")
#b.save_sysetm("jpg")
#b.save_sysetm("svg")
# und anzeigen (optional, aber von Vorteil)
b.show()
