b=`curl -s "https://tableau.azdhs.gov/views/COVID-19Table/COVID-19table?%3AisGuestRedirectFromVizportal=y&%3Aembed=y" | pup 'textarea text{}' | recode html | jq -r .sessionid`
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/bootstrapSession/sessions/$b" \
  -H 'Connection: keep-alive' \
  -H 'Accept: text/javascript' \
  -H 'X-Tsi-Active-Tab: COVID-19%20table' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/82.0.4077.0 Safari/537.36' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Origin: https://tableau.azdhs.gov' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://tableau.azdhs.gov/views/COVID-19Table/COVID-19table?%3AisGuestRedirectFromVizportal=y&%3Aembed=y' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: tableau_locale=en; workgroup_session_id=""' \
  --data-raw 'worksheetPortSize=%7B%22w%22%3A800%2C%22h%22%3A800%7D&dashboardPortSize=%7B%22w%22%3A800%2C%22h%22%3A800%7D&clientDimension=%7B%22w%22%3A1200%2C%22h%22%3A754%7D&renderMapsClientSide=true&isBrowserRendering=true&browserRenderingThreshold=100&formatDataValueLocally=false&clientNum=&navType=Reload&navSrc=Top&devicePixelRatio=1&clientRenderPixelLimit=25000000&sheet_id=COVID-19%2520table&showParams=%7B%22checkpoint%22%3Afalse%2C%22refresh%22%3Afalse%2C%22refreshUnmodified%22%3Afalse%7D&stickySessionKey=%7B%22featureFlags%22%3A%22%7B%7D%22%2C%22isAuthoring%22%3Afalse%2C%22isOfflineMode%22%3Afalse%2C%22lastUpdatedAt%22%3A1583856033467%2C%22viewId%22%3A234%2C%22workbookId%22%3A26%7D&filterTileSize=200&locale=en_US&language=en&verboseMode=false&:session_feature_flags=%7B%7D&keychain_version=1' \
  --compressed > /dev/null


#curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_10329084236957726728?csv=true&showall=true" 

curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_10329084236957726728?csv=true&showall=true" |tee travel_person/travel_person$(date +%s).csv | xsv table
a=($(ls travel_person)) ; csvdiff -p '4,4' travel_person/${a[-2]} travel_person/${a[-1]}
echo ''
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_133021235305994309?csv=true&showall=true" |tee total_cases_death/total_cases_death$(date +%s).csv | xsv table
a=($(ls total_cases_death)) ; csvdiff total_cases_death/${a[-2]} total_cases_death/${a[-1]}
echo ''
curl -s "https://tableau.azdhs.gov/vizql/w/COVID-19Table/v/COVID-19table/vud/sessions/$b/views/8275719771277684273_2738315765867498942?csv=true&showall=true" |tee testing/testing$(date +%s).csv | xsv table
a=($(ls testing)) ; csvdiff testing/${a[-2]} testing/${a[-1]}

