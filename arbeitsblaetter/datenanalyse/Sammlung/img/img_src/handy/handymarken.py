#!/usr/bin/python3
from plotting_lib import draw_pie_chart,save_system
import matplotlib.pyplot as plt

# Daten definieren
marken = ["Apple", "Samsung", "Huawei", "Nokia", "Sony", "Wiko", "HTC", "andere"]
absatz = [612, 525, 132, 53, 49, 23, 22, 84]

# Diagramm zeichnen
fig, ax= draw_pie_chart(marken, absatz, title="Marktanteile Handys")
save_system(fig, "Handymarken.png")
plt.show()

