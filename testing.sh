htmltab 'https://docs.google.com/spreadsheets/d/18oVRrHj3c183mHmq3m89_163yuYltLNlOmPerQ18E8w/gviz/tq?tqx=out:html&tq&' > testing.csv
csvjoin -c 'Postal,State' -I state.csv testing.csv  | csvcut -c '1,2,3,4,6,8,9,10,11' > testing_state_join.csv
