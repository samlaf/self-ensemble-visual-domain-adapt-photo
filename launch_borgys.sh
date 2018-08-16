counter=${1}
for GLW in 0.1 0.5 1.0; do
    NAME="graph:graph_loss_wt=$GLW";
    borgy submit -f ~/.borgy/selfens.yml --name $NAME \
	  -- bash -c "sh visda2018.sh 0 $counter $GLW";
    counter=$((counter+1))
done
