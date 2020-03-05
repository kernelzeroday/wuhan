htmltab -s 1  https://bnonews.com/index.php/2020/02/the-latest-coronavirus-cases/ > 1.csv
htmltab -s 2  https://bnonews.com/index.php/2020/02/the-latest-coronavirus-cases/ > 2.csv
csvstack 1.csv 2.csv -g inside,outside -n china | sed 's/MAINLAND CHINA/location/g' > 3.csv
csvstack -g "`date +%s`" -n unixtime 3.csv > 4.csv
csvstack -g "`date`" -n date2 4.csv | csvcut -c "3,4,5,6,7,1,2" | tee -a csv/bno_$(date +%s).csv | xsv table

