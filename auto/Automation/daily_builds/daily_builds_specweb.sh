#!/bin/bash
mv -f new_daily.txt old_daily.txt
curl http://10.73.4.43/osprey-daily-builds/ >> html_daily.txt
grep -n "binaries" html_daily.txt > http_daily_sort.txt
echo line=$(head -n 1 http_daily_sort.txt) | gawk -F "" '{print $87,$88,$89,$90, $91, $92}' > new_daily.txt
DIFF_OUTPUT="$(diff new_daily.txt old_daily.txt)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
            echo "----------------------------------------"
            echo
            echo "Daily Build Release Updated...!!!"   
            echo "Old Version: $(cat old_daily.txt)"
            echo "New Version: $(cat new_daily.txt)"
            echo
	    echo "----------------------------------------"
            echo
            echo "Binary Files Updated:"
            head -3 http_daily_sort.txt > raw_daily_binary.txt   #To select first 3 lines in file
        	cut -c19- raw_daily_binary.txt | rev | cut -c21- | rev > daily_binaries.txt # to cut first n lines and last n characters in line
		cat daily_binaries.txt
                echo
		echo "FW Binary file URL"
		awk 'NR==1' daily_binaries.txt  # To select first line in file)
		echo "BIOS Binary file URL"
		awk 'NR==2' daily_binaries.txt  # To select second line in file)
		echo "Int Binary file URL"
                awk 'NR==3' daily_binaries.txt  # To select second line in file)

       else 
                echo "----------------------------------------" 
	        echo
		echo "Daily Build Release Not Updated...!!!"
                echo "Old Version: $(cat old_daily.txt)"
                echo "New Version: $(cat new_daily.txt)"
		echo
                echo "----------------------------------------"

     fi
