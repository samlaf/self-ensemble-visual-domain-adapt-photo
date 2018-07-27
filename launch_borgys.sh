for UW in 1. 5. 10.; do
    for CB in 0.001 0.0001; do
	for CT in 0.5 0.7 0.9; do
	    NAME="UW=$UW,CB=$CB,CT=$CT";
	    borgy submit -f ~/.borgy/selfens.yml --name $NAME \
	    -- bash -c \
		  "python -u experiment_selfens_meanteacher.py --exp=visda_train_val --arch=resnet152 --img_size=160 --batch_size=56 --double_softmax --use_dropout --src_hflip --tgt_hflip --src_affine_std=0.0 --tgt_affine_std=0.0 --src_scale_u_range=0.75:1.333 --tgt_scale_u_range=0.75:1.333 --src_intens_scale_range=0.75:1.333 --tgt_intens_scale_range=0.75:1.333 --src_greyscale --tgt_greyscale --img_pad_width=16 --epoch_size=target --unsup_weight=$UW --cls_balance=$CB --confidence_thresh=$CT --fix_layers=conv1,bn1,layer1 --num_epochs=100 --learning_rate=1e-5 --log_file=results_visda17/res_visda17_trainval_resnet152_run$NAME.txt --result_file=results_visda17/history_visda17_trainval_resnet152_run$NAME.h5 --model_file=results_visda17/model_visda17_trainval_resnet152_run$NAME.pkl --device=0 --hide_progress_bar --visda2018 --use_other_target --use_other_source"
	done
    done
done
