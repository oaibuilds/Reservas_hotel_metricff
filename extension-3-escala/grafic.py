import matplotlib.pyplot as plt

# ------------------------------

temps_2 = [0.15,0.16,0.16,0.16,0.15,0.15,0.32,0.16,0.31,0.16]
temps_3 = [0.31,0.31,0.15,0.31,0.15,0.15,0.31,0.3,0.31,0.16]
temps_4 = [0.15,0.16,0.31,0.15,8.28,0.47,3.76,0.94,0.62,0.16]
temps_5 = [0.31,0.63,0.15,0.47,15.15,0.16,2.98,2.93,15.2,0.31]

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