import numpy as np

directory = '/home/david/Documents/Paper_cutoffFrequencies/espectros_rrsanos_1024/sp513_'
ages = np.loadtxt('/home/david/Documents/ages_ord.txt')
names = np.loadtxt('/home/david/Documents/nombres.txt', dtype=str)


age_m = np.array([0, 0.5, 1.5, 2.08, 4.5, 7, 10, 14, 24, 26, 34, 45, 70, 74])
amp_m = []
for i in range(len(age_m)-2):
    c = np.where((ages > age_m[i]) & (ages <= age_m[i+1]))[0]
    lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
    np.savetxt('sp513_' + str(age_m[i]) + '__' + str(age_m[i+1]) + '.txt', lst)


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