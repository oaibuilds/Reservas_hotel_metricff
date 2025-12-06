import matplotlib.pyplot as plt


temps_2 = [0.15,0.15,0.32,0.15,0.47,0.16,0.15,0.31,0.16,0.16]
temps_3 = [0.16,0.32,0.16,0.47,0.16,2.03,0.46,0.93,0.16,0.46]
temps_4 = [0.78,0.16,2.03,0.31,12.02,2.82,8.43,1.41,6.09,3.59]
temps_5 = [1.25,1.25,15.7,1.72,4.15,11.4,16.09,5.04,28.7,0.62]

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