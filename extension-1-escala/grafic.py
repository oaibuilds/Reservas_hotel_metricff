import matplotlib.pyplot as plt

# ------------------------------
# EXEMPLE D'US
# ------------------------------
# temps_1, temps_2, temps_3, temps_4 són llistes de 10 valors cada una
# Pots substituir aquests exemples pels teus 10 temps reals

temps_2 = [0.3,0.16,0.47,0.15,0.15,0.16,0.15,0.15,0.15,0.16]
temps_3 = [0.15,0.31,0.31,0.15,0.16,0.15,0.15,0.16,0.31,0.15]
temps_4 = [0.32,0.15,0.16,0.31,1.25,0.16,3.28,2.81,0.46,0.15]
temps_5 = [0.15,1.87,0.15,0.15,6.43,0.32,7.49,9.8,9.95,0.32]

# ------------------------------
# CREACIÓ DEL BOXPLOT
# ------------------------------
data = [temps_2, temps_3, temps_4, temps_5]
labels = ['Tamaño 2', 'Tamaño 3', 'Tamaño 4', 'Tamaño 5']

plt.figure(figsize=(8,6))
plt.boxplot(data, labels=labels, patch_artist=True,
            boxprops=dict(facecolor='lightblue', color='blue'),
            medianprops=dict(color='red'))
plt.ylabel('Tiempo (segundos)')
plt.title('Comparación del tiempo de resolución según el tamaño del problema')
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()

# ------------------------------
# LÍNIA PER AJUNTAR ELS BOXPLOTS
plt.plot([1,2,3,4], [sum(x)/len(x) for x in data], color='green', marker='o', linestyle='--')
plt.legend()

plt.show()