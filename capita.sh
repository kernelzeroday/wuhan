csvsort -c "Case PerCapita" capita.csv -r -I | xsv table
csvsort -c 'Confirmed PerCapita' -I -r state_percap.csv | xsv table
