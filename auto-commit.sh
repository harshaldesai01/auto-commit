#!/bin/sh

for file in *
do
    sum1="$(md5sum "$file")"
    sleep 60
    sum2="$(md5sum "$file")"

    if [ "$sum1" = "$sum2" ]
    then
        echo "No changes!"
    else
	echo "Pushing changes..."
        git add .
        git commit -m "commiting changes at 'date + '%Y-%m-%d %H: %M: %S''"
        git pull https://github.com/harshaldesai01/auto-commit
        git push https://github.com/harshaldesai01/auto-commit
        echo "Changes pushed!"
    fi
done
