curl -s 'https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/1266E487E5F94CAB913DBC79AE32FA47-1:0/views/8275719771277684273_10329084236957726728?csv=true&showall=true' |tee travel_person$(date +%s).csv | xsv table
echo ''
curl -s 'https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/1266E487E5F94CAB913DBC79AE32FA47-1:0/views/8275719771277684273_133021235305994309?csv=true&showall=true' |tee total_cases_death$(date +%s).csv | xsv table
echo ''
curl -s 'https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/1266E487E5F94CAB913DBC79AE32FA47-1:0/views/8275719771277684273_2738315765867498942?csv=true&showall=true' |tee testing$(date +%s).csv | xsv table
