for i in `ls *.ods`; do echo "$i" ; csvtotable -o `echo "$i" | sed 's/ods/csv/g'` "html/$i.html" ; done
