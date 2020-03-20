#curl -s 'https://static01.nyt.com/newsgraphics/2020/01/21/china-coronavirus/43232c77c4a0b1840abb3449a58cca018fe3e518/build/js/chunks/model.js' > model.mjs
#curl -s 'https://static01.nyt.com/newsgraphics/2020/01/21/china-coronavirus/9bea2a9d1d2fa8120c60cfcb4dac698179ef343a/build/js/chunks/model.js' > model.mjs
curl `curl -s 'https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html' | pup | grep 'NYTG.load' | grep main |sed 's/    NYTG.load(//g' | sed 's/);//g' | sed 's/main/chunks\/model-lite/g' | tr -d \'` > model.mjs
node nyt2 | jq '.u' | in2csv -f json > nyt_us_full.csv
csvstack -g "`date +%s`" -n unixtime nyt_us_full.csv |csvstack -g "`date`" -n date2 >> nyt2/nyt_us_full_$(date +%s).csv
node nyt2 | jq '.b' | in2csv -f json > nyt_us_county.csv
csvstack -g "`date +%s`" -n unixtime nyt_us_county.csv |csvstack -g "`date`" -n date2 >> nyt2/nyt_us_county_$(date +%s).csv 
node nyt2 | jq '.a' | in2csv -f json > nyt_intl_full.csv
csvstack -g "`date +%s`" -n unixtime nyt_intl_full.csv |csvstack -g "`date`" -n date2 >> nyt2/nyt_intl_full_$(date +%s).csv 
