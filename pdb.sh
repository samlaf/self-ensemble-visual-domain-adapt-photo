python -m pdb experiment_selfens_meanteacher.py --exp=visda_train_val --arch=resnet152 --img_size=160 --batch_size=56 --double_softmax --use_dropout --src_hflip --tgt_hflip --src_affine_std=0.0 --tgt_affine_std=0.0 --src_scale_u_range=0.75:1.333 --tgt_scale_u_range=0.75:1.333 --src_intens_scale_range=0.75:1.333 --tgt_intens_scale_range=0.75:1.333 --src_greyscale --tgt_greyscale --img_pad_width=16 --epoch_size=200 --unsup_weight=10.0 --cls_balance=0.01 --confidence_thresh=${3} --fix_layers=conv1,bn1,layer1 --num_epochs=100 --learning_rate=1e-5 --log_file=results_visda17/res_visda17_trainval_resnet152_run${2}.txt --result_file=results_visda17/history_visda17_trainval_resnet152_run${2}.h5 --model_file=results_visda17/model_visda17_trainval_resnet152_run${2}.pkl --dct_file=results_visda17/dct_visda17_trainval_resnet152_run${2}.json --device=${1} --visda2018 --use_other_source ${5} --use_other_target -1 --use_bce ${4} --use_other_mask --threshold_pred 0.5
