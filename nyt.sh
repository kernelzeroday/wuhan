node nyt2 | jq '.u' | in2csv -f json > nyt_us_full.csv
csvstack -g "`date +%s`" -n unixtime nyt_us_full.csv |csvstack -g "`date`" -n date2 | tee -a nyt2/nyt_us_full_$(date +%s).csv
node nyt2 | jq '.b' | in2csv -f json > nyt_us_county.csv
csvstack -g "`date +%s`" -n unixtime nyt_us_county.csv |csvstack -g "`date`" -n date2 | tee -a nyt2/nyt_us_county_$(date +%s).csv
node nyt2 | jq '.l' | in2csv -f json > nyt_intl_full.csv
csvstack -g "`date +%s`" -n unixtime nyt_intl_full.csv |csvstack -g "`date`" -n date2 | tee -a nyt2/nyt_intl_full_$(date +%s).csv
