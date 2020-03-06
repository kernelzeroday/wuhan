curl 'https://static01.nyt.com/newsgraphics/2020/01/21/china-coronavirus/43232c77c4a0b1840abb3449a58cca018fe3e518/build/js/chunks/model.js' > model.mjs
echo "Confirmed,County" >county_count.csv ; node nyt2 | jq '.u[]."County where treated"' -r | uniq -c | tr -s ' ' | sed 's/^ //g' | sed 's/ /,/' >> county_count.csv
tr a-z A-Z < county_count.csv |csvcut -c '2,1' > county_count_upper.csv
awk 'BEGIN{FS=OFS=","}{a[$1]+=$2}END{for(i in a) print i,a[i]}' county_count_upper.csv > county_count_upper_sum.csv
awk 'BEGIN{FS=OFS=","}{a[$1]+=$2}END{for(i in a) print i,a[i]}' icu_ca.csv > icu_ca_sum.csv
echo "COUNTY,CONFIRMED,ICU BED COUNT" > california_icu_data.csv
csvjoin -c '1,1' county_count_upper_sum.csv icu_ca_sum.csv >> california_icu_data.csv 

bash nyt.sh

tr a-z A-Z < nyt_us_county.csv > nyt_us_county_upper.csv

csvjoin -c '1,1' nyt_us_county_upper.csv california_icu_data.csv -I | csvcut -c 'COUNTY,POPULATION_2010,CONFIRMED,13,ICU BED COUNT' > california.csv 
csvjoin -c 'COUNTY,COUNTY' california.csv california_hospital_count_county.csv -I | sponge california.csv


csvstack -g "`date +%s`" -n unixtime california.csv |csvstack -g "`date`" -n date2 | csvcut -c "3,4,5,6,1,2" | tee -a ca_county/ca_county_$(date +%s).csv | xsv table
a=($(ls ca_county)) ; csvdiff -p '1,0' --columns '0,1,2,3' ca_county/${a[-2]} ca_county/${a[-1]}

