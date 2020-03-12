import pandas as pd
import time

df = pd.read_csv('../california.csv')                                                                                                                                                              


df['HOSPITALS PERCAP'] = df['HOSPITALS'] / df['POPULATION_2010']
df['CONFIRMED PERCAP'] = df['CONFIRMED'] / df['POPULATION_2010']
df['DEATHS PERCAP'] = df['DEATHS'] / df['POPULATION_2010']
df['ICU BED COUNT PERCAP'] = df['ICU BED COUNT'] / df['POPULATION_2010']
df['CONFIRMED PERHOSP'] = df['CONFIRMED'] / df['HOSPITALS'] 
df['DEATHS PERHOSP'] = df['DEATHS'] / df['HOSPITALS'] 
df['ICU BED COUNT PERHOSP'] = df['ICU BED COUNT'] / df['HOSPITALS'] 
df['date']  = pd.to_datetime('today')

df.round(8).to_csv('output/california_processed_' + str(int(time.time()) ) + '.csv', float_format='%.8f')
df.round(8).to_csv('output/california_processed.csv', float_format='%.8f')
