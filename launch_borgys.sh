counter=${1}
for THRESH_MASK in 0 0.3 0.5 0.7; do
    for THRESH_PRED in 0 0.3 0.5 0.7; do
	NAME="mask_cb:THRESH_MASK=$THRESH_MASK,THRESH_PRED=$THRESH_PRED";
	borgy submit -f ~/.borgy/selfens.yml --name $NAME --restartable \
	      -- bash -c \
	      "sh visda2018.sh 0 $counter $THRESH_MASK $THRESH_PRED --use_other_mask";
	counter=$((counter+1))
    done
done
