counter=${1}
for THRESH_MASK in 1.0; do
    for SIGMOID in True; do
	for OTHER in -1 0; do
	    for THRESH_PRED in 0.1 0.3 0.5; do
	    NAME="sigmoid-threshold:THRESH_MASK=$THRESH_MASK,SIGMOID=$SIGMOID,OTHER=$OTHER,THRESH_PRED=$THRESH_PRED";
	    borgy submit -f ~/.borgy/selfens.yml --name $NAME --restartable \
		  -- bash -c \
		  "sh visda2018.sh 0 $counter $THRESH_MASK $SIGMOID $OTHER $THRESH_PRED";
	    counter=$((counter+1))
	    done
	done
    done
done
