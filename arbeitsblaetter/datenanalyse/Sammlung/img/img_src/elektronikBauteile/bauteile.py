#!/usr/bin/python3
# see https://github.com/pheek/pyPlotLib

from bmsw_graph_lib import b

b.set_fontsize(20)

# 1. System erstellen 
b.draw_system(16, 23, 0, 12, y_axis_at=16.5)

# 2. Daten definierensave_system(fig, "barchart1.png")

stk_x = [17, 18, 19, 20, 21, 22]
sch_y = [ 3,  5,  4, 11,  2,  1]

# 3. Säulen zeichnen
b.draw_bar_chart(stk_x, sch_y)

b.text(19  , -1.5, 'Bauteile pro Schachtel', color='#000000')
b.text(15.5,  4  , 'Anzahl Schachteln'     , color='#000000', rotation=90)

b.save_system("png")
