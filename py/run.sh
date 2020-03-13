python3 states.py
csvtotable -o output/state_processed.csv ../html/state_full.html
python3 california.py
csvtotable -o output/california_processed.csv ../html/california_full.html
python3 world.py
csvtotable -o output/world_processed.csv ../html/world_full.html


bash jhu.sh
csvtotable -o output/jhu_us_delta_processed.csv ../html/jhu_delta.html
