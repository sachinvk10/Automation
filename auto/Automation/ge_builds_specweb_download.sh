#!/bin/bash
#mv -f new.txt old.txt
curl http://10.73.4.43/builds/ >> html.txt
grep -n "binaries" html.txt > http_sort.txt
echo line=$(head -n 1 http_sort.txt) | gawk -F "" '{print $90, $91, $92, $93,$94,$95,$96}' > new.txt
DIFF_OUTPUT="$(diff new.txt old.txt)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
            echo "----------------------------------------"
            echo
            echo "Build Release Updated...!!!"
            echo "Old Version: $(cat old.txt)"
            echo "New Version: $(cat new.txt)"
            echo
            echo "----------------------------------------"
	    echo
            echo "Updated Binary files:"
	        head -6 http_sort.txt > raw_binary.txt   #To select first 6 lines in file
        	cut -c19- raw_binary.txt | rev | cut -c21- | rev > binaries.txt # to cut first n lines and last n characters in line
		cat binaries.txt
            echo
	       echo "FW Binary file URL"
		awk 'NR==1' binaries.txt  # To select first line in file)
                echo "BIOS Binary file URL"
		awk 'NR==2' binaries.txt  # To select second line in file)
        	echo "BMC Binary file URL"
                awk 'NR==4' binaries.txt  # To select second line in file)
		rm -fv *tar.xz 
		#wget http://den-swweb.amperecomputing.com 'NR==1' binaries.txt
                 wget $(head -n 1 binaries.txt)
       else 
		echo "----------------------------------------"
                echo
		echo "Build Release Not Changed...!!!"
		echo "Old Version: $(cat old.txt)"
                echo "New Version: $(cat new.txt)"
                echo
                echo "----------------------------------------"
     fi
