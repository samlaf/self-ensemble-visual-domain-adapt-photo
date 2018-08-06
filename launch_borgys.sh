counter=${1}
for UW in 10.; do
    for CB in 0.01 0.1; do
	for CT in 0.8 0.9 0.95 0.99; do
	    NAME="ANOM_DETECT_UW=$UW,CB=$CB,CT=$CT";
	    borgy submit -f ~/.borgy/selfens.yml --name $NAME \
		  -- bash -c "sh visda2018.sh 0 $counter $CB $CT";
	    counter=$((counter+1))
	done
    done
done
