git pull --recurse-submodules
./get_bno
./get_bno_usa
bash bno_usa_pop.sh
#bash state.sh
bash county.sh 
bash nys_icu.sh
bash tables.sh
cd az ; bash session.sh ; cd ..
cd py ; bash run.sh ; cd ..
bash git_update.sh
