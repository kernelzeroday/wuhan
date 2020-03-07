node nyt.js  > nyt.html ; htmltab -s 1 nyt.html > state.csv
csvjoin -c 'NAME,State' state_pop_data_nst.csv state.csv | sponge state.csv
csvjoin -c 'NAME,Name' state.csv state_hospital_count.csv | sponge state.csv
csvstack -g "`date +%s`" -n unixtime state.csv |csvstack -g "`date`" -n date2 | csvcut -c "3,4,5,6,7,8,1,2" | tee -a nyt/nyt_state_$(date +%s).csv | xsv table
a=($(ls nyt)) ; csvdiff -p '1,0' --columns '0,1,2,3' nyt/${a[-2]} nyt/${a[-1]}
