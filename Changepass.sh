while read line; 
do 
    userName=$(echo $line | grep -v nologin | cut -d ":" -f 1) #| echo -e "$1\n$1" | passwd $line
    if [ $(echo $userName | awk '{print length}') -gt 1 ]
    then
        echo "Changing passwd of $userName"
        echo -e "$1\n$1" | passwd $userName
    fi
done < /etc/passwd
