counter=${1}
for GLW in 1 5 10; do
    NAME="graph:graph_loss_wt=$GLW--(dontuseothermask)";
    borgy submit -f ~/.borgy/selfens.yml --name $NAME \
	  -- bash -c "sh visda2018.sh 0 $counter $GLW";
    counter=$((counter+1))
done
