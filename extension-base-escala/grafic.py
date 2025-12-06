import matplotlib.pyplot as plt

# ------------------------------


temps_2 = [0.15,0.16,0.15,0.16,0.16,0.14,0.15,0.3,0.15,0.16]
temps_3 = [0.16,0.16,0.15,0.15,0.30,0.31,0.93,0.15,0.15,0.16]
temps_4 = [0.31,0.31,0.46,0.15,0.93,0.16,2.81,3.61,0.46,0.15]
temps_5 = [0.31,16.78,0.31,0.31,5.81,0.3,49.06,7.25,7.67,4.01]

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