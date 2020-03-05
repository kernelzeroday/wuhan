echo "Confirmed,County" >county_count.csv ; node nyt2 | jq '.u[]."County where treated"' -r | uniq -c | tr -s ' ' | sed 's/^ //g' | sed 's/ /,/' >> county_count.csv
