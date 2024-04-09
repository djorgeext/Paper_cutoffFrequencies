import os
import pandas as pd

directory = '/home/david/Documents/Paper_cutoffFrequencies/SP'
folders = []

for root, dirs, files in os.walk(directory):
    folders.extend(dirs)


data = pd.read_excel('edades.xlsx')
print(len(data)
#for i in range(len(data))