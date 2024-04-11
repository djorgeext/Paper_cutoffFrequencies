import numpy as np
import matplotlib.pyplot as plt

directory = '/home/david/Documents/Paper_cutoffFrequencies/Espectros513_con_NormSTD1/sp513_'
ages = np.loadtxt('ages_ord.txt')
names = np.loadtxt('nombres.txt', dtype=str)


age_m = []  # list to storage ages of different values
amp_m = []   # average amplitudes of correspondent ages
f = np.linspace(0, 0.5, 513)
i = 0
while i < len(ages):
    c = np.where(ages == ages[i])[0] # Encontrar los índices donde freq tiene el mismo valor que freq[i]
    lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
    age_m.append(ages[i])
    np.savetxt('sp513_' + str(ages[i]) + '.txt', lst)
    i = c[-1] + 1
""" amp_m.append(np.mean(amp[c]))     # Calcular el promedio de las amplitudes correspondientes
age_m.append(ages[i])            # Agregar la frecuencia al arreglo freq_m
i = c[-1] + 1                     # Actualizar i al siguiente índice después del último índice donde freq es igual a freq[i]

# Convertir las listas a arreglos de numpy si es necesario
age_m = np.array(age_m)
amp_m = np.array(amp_m) """


#print(np.unique(ages))
#print(lst.shape)
#plt.plot(np.log10(f[1:]), np.log10(lst[1:]))
#plt.show()
#pr = np.loadtxt(directory + df[0] + '.txt')
#pr.reshape((1, -1)).shape








#print(file_path)