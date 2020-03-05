csvjoin -c '1,1' nyt_us_county.csv nysIcuByCounty.csv | csvgrep -c 2 -m 'New York' | csvcut -c '1,2,8,12,13,14' | xsv table
