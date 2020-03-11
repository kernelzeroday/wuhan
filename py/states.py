import pandas as pd
import time

df = pd.read_csv('../bno_usa_pop_test_join.csv')

df['Hosp Percap'] = df['Hospital Count'] / df['POPESTIMATE2019']
df['Cases Percap'] = df['Cases'] / df['POPESTIMATE2019']
df['Deaths Percap'] = df['Deaths'] / df['POPESTIMATE2019']
df['Serious Percap'] = df['Serious'] / df['POPESTIMATE2019']
df['Critical Percap'] = df['Critical'] / df['POPESTIMATE2019']
df['Recovered Percap'] = df['Recovered'] / df['POPESTIMATE2019']
df['Positive Percap'] = df['Positive'] / df['POPESTIMATE2019']
df['Negative Percap'] = df['Negative'] / df['POPESTIMATE2019']
df['Pending Percap'] = df['Pending'] / df['POPESTIMATE2019']
df['Total Percap'] = df['Total'] / df['POPESTIMATE2019']
df['Cases PerHosp'] = df['Cases'] / df['Hospital Count']
df['Total PerHosp'] = df['Total'] / df['Hospital Count']
df['Deaths PerHosp'] = df['Deaths'] / df['Hospital Count']
df['Serious PerHosp'] = df['Serious'] / df['Hospital Count']
df['Critical PerHosp'] = df['Critical'] / df['Hospital Count']
df['Recovered PerHosp'] = df['Recovered'] / df['Hospital Count']
df['Positive PerHosp'] = df['Positive'] / df['Hospital Count']
df['Negative PerHosp'] = df['Negative'] / df['Hospital Count']
df['Pending PerHosp'] = df['Pending'] / df['Hospital Count']
df['Death per Death plus Rec'] = df['Deaths'] / (df['Deaths'] + df['Recovered'])

df['date']  = pd.to_datetime('today')

df.round(8).to_csv('output/state_processed_' + str(int(time.time()) ) + '.csv', float_format='%.8f')
df.round(8).to_csv('output/state_processed.csv', float_format='%.8f')
