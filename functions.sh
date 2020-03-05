csvsort -I -r  -c 'Case PerCapita' capita.csv | xsv table
echo ''
csvsort -I -r -c 'Cases per Hospital' state_percap.csv | xsv table
echo ''
csvsort -I -r -c 'CONFIRMED PER ICU' california_functions.csv | xsv table
