import numpy as np

directory = '/home/david/Documents/Paper_cutoffFrequencies/espectros_rrsanos_1024/sp513_'
ages = np.loadtxt('/home/david/Documents/Paper_cutoffFrequencies/ages_ord.txt')
names = np.loadtxt('/home/david/Documents/Paper_cutoffFrequencies/nombres.txt', dtype=str)

amp_m = []

c = np.where((ages > 0) & (ages <= 0.5))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(0) + '__' + str(0.5) + '.txt', lst)

c = np.where((ages > 0.5) & (ages <= 1.5))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(0.5) + '__' + str(1.5) + '.txt', lst)

c = np.where((ages > 1.5) & (ages <= 2.08))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(1.5) + '__' + str(2.08) + '.txt', lst)

c = np.where((ages > 2.08) & (ages <= 4.5))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(2.08) + '__' + str(4.5) + '.txt', lst)

c = np.where((ages >= 7.0) & (ages <= 10))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(7) + '__' + str(10) + '.txt', lst)

c = np.where((ages >= 11) & (ages <= 14))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(11) + '__' + str(14) + '.txt', lst)

c = np.where((ages >= 15) & (ages <= 24))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(15) + '__' + str(24) + '.txt', lst)

c = np.where((ages >= 26) & (ages <= 34))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(26) + '__' + str(34) + '.txt', lst)

c = np.where((ages >= 35) & (ages <= 45))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(35) + '__' + str(45) + '.txt', lst)

c = np.where((ages >= 70) & (ages <= 74))[0]
lst = np.array([np.loadtxt(directory + names[i] + '.txt') for i in c]).mean(axis=0)
np.savetxt('sp513_' + str(70) + '__' + str(74) + '.txt', lst)

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