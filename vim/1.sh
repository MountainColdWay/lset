for i in $(cat ~/txt);do
	echo $i
	git clone $i
done
