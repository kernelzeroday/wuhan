bash testing.sh
csvjoin -I -c 'NAME,UNITED STATES' state_pop_data_nst.csv bno_usa.csv > bno_usa_pop.csv
csvjoin -I -c 'NAME,Name' bno_usa_pop.csv state_hospital_count.csv | sponge bno_usa_pop.csv
csvjoin -c 'Postal,State' -I bno_usa_pop.csv testing.csv | csvcut -c '1,2,3,4,5,6,7,10,12,13,14,15' > bno_usa_pop_test_join.csv
xsv table bno_usa_pop_test_join.csv
