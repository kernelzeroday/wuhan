#pulled from https://tableau.azdhs.gov/views/COVID-19Table/COVID-19table?:isGuestRedirectFromVizportal=y&:embed=y
b=$(node arizona.js | pup 'textarea text{}' | recode html | jq -r .sessionid)
echo $b
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_10329084236957726728?csv=true&showall=true" |tee travel_person/travel_person$(date +%s).csv | xsv table
a=($(ls travel_person)) ; csvdiff -p '4,4' travel_person/${a[-2]} travel_person/${a[-1]}
echo ''
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_133021235305994309?csv=true&showall=true" |tee total_cases_death/total_cases_death$(date +%s).csv | xsv table
a=($(ls total_cases_death)) ; csvdiff total_cases_death/${a[-2]} total_cases_death/${a[-1]}
echo ''
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_2738315765867498942?csv=true&showall=true" |tee testing/testing$(date +%s).csv | xsv table
a=($(ls testing)) ; csvdiff testing/${a[-2]} testing/${a[-1]}
