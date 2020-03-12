import pandas as pd
import time

df = pd.read_csv('../pop_join.csv')


df['Cases PerCapita'] = df['Cases'] / df['Year_2016']
df['Deaths PerCapita'] = df['Deaths'] / df['Year_2016']
df['Serious PerCapita'] = df['Serious'] / df['Year_2016']
df['Critical PerCapita'] = df['Critical'] / df['Year_2016']
df['Recovered PerCapita'] = df['Recovered'] / df['Year_2016']
df['Deaths per Death plus Rec'] = df['Deaths'] / (df['Deaths'] + df['Recovered'])

df['date']  = pd.to_datetime('today')

df.round(8).to_csv('output/world_processed_' + str(int(time.time()) ) + '.csv', float_format='%.8f')
df.round(8).to_csv('output/world_processed.csv', float_format='%.8f')
