#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib

from bmsw_graph_lib import b

b.set_fontsize(20)

messwerte = [6.44, 6.81, 6.88, 7.01, 7.22, 7.23, 7.38, 7.39, 7.42, 7.43, 7.44, 7.51, 7.52, 7.53, 7.61, 7.62, 7.63, 7.71, 7.72, 7.73, 7.74, 7.75, 7.76, 7.81, 7.82, 7.83, 7.91, 7.92, 7.93, 7.94, 7.95, 7.96, 7.97, 7.98, 7.99, 8.01, 8.02, 8.03, 8.04, 8.05, 8.11, 8.12]

# A
b.draw_system(6, 9, 0, 33)
b.draw_histogram(messwerte, bin_width=1, start_value=6.0)
b.text(5.9, 6, "absolute Häufigkeiten", rotation=90)

# B
b.draw_system(6, 9, 0, 17)
b.draw_histogram(messwerte, bin_width=0.4, start_value=6.3)
b.text(5.9, 6, "absolute Häufigkeiten", rotation=90)

# C
b.draw_system(6, 9, 0, 24)
b.draw_histogram(messwerte, bin_width=0.5, start_value=6.5)
b.text(5.9, 6, "absolute Häufigkeiten", rotation=90)

# D
b.draw_system(6, 9, 0, 9)
b.draw_histogram(messwerte, bin_width=0.1, start_value=6.4)
b.text(5.9, 1, "absolute Häufigkeiten", rotation=90)


#b.save_system("eps")
#b.save_system("png")
b.show()
