import pandas as pd
import time

df = pd.read_csv('time_series_19-covid-Confirmed.csv')
df = df[['Province/State' , 'Country/Region', 'Lat', 'Long',  df.columns[-2], df.columns[-1]]] 
df['Delta'] = (df[df.columns[-1]]  - df[df.columns[-2]])
df['Percentage'] = df['Delta'] / df[df.columns[-3]] 
df['Percentage'] = df['Percentage'] * 100 
 
df['date']  = pd.to_datetime('today')

df.round(8).to_csv('output/jhu_us_delta_processed_' + str(int(time.time()) ) + '.csv', float_format='%.8f')
df.round(8).to_csv('output/jhu_us_delta_processed.csv', float_format='%.8f')

