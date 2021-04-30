FILE="ip.txt"
 
if [ -e $FILE ]; then
    echo "File exists."
    rm $FILE
fi

touch $FILE