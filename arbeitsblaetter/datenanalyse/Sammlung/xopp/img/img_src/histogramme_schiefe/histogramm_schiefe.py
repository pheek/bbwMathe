#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib

from bmsw_graph_lib import b

b.set_fontsize(20)


werte1 = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 7, 8, 9, 10, 10, 8, 4, 1, 2, 3, 5, 2, 1, 1, 2, 3, 6, 9, 2, 1, 7, 4, 5, 2, 1, 3, 2, 1, 10, 8, 5]



werte2 = [1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 9, 9, 10, 10, 5, 4, 6, 3, 7, 2, 9, 1, 9, 5, 5, 4, 6, 5, 3, 7, 5, 4, 6]


werte3 = [1, 2, 2, 3, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 1, 3, 10, 8, 9, 7, 5, 10, 9, 8, 10, 9, 8, 7, 10, 9, 8, 10, 4, 2, 10, 9, 10]

# A
b.draw_system(1, 12, 0, 14)
b.draw_histogram(werte1, bin_width=1, start_value=1)
b.text(-1.2, 1, "absolute Häufigkeiten", rotation=90)

# B
b.draw_system(1, 12, 0, 14)
b.draw_histogram(werte2, bin_width=1, start_value=1)
b.text(-1.2, 1, "absolute Häufigkeiten", rotation=90)

# B
b.draw_system(1, 12, 0, 14)
b.draw_histogram(werte3, bin_width=1, start_value=1)
b.text(-1.2, 1, "absolute Häufigkeiten", rotation=90)




#b.save_system("eps")
#b.save_system("png")
b.show()
