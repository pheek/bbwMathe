#!/usr/bin/python3
from plotting_lib import draw_pie_chart,save_system
import matplotlib.pyplot as plt

# Daten definieren
marken = ["neu: 89.8%", "gebraucht: 10.2%"]
absatz = [1864, 212]


# Diagramm zeichnen
fig, ax= draw_pie_chart(marken, absatz, title="Handykauf: neu vs. gebraucht")
save_system(fig, "HandykaufNeuGebraucht.png")
plt.show()

