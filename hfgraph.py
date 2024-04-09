import os
import numpy as np
import matplotlib.pyplot as plt

directory = '/home/david/Documents/Paper_cutoffFrequencies/SP'

edades = np.loadtxt('ages_ord.txt')
df = np.loadtxt('nombres.txt', dtype = str)
hfarea = []

for i in range(len(df)):
    folder_name = df[i]
    folder_path = os.path.join(directory, folder_name)
    file_path = os.path.join(folder_path, 'hfarea.txt')
    hfarea.append(np.loadtxt(file_path))

print(df[0])