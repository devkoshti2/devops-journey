echo "Enter number: "
read num

if [ ${num} -gt 10 ];
then
	echo "10 se bada hai"
elif [ ${num} -lt 10 ];
then
	echo "10 se chota hai"
else [ ${num} -eq 10 ];
	echo "10 se equal hai"
fi
