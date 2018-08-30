import json
import sys
import csv

file = 'results_visda17/dct_visda17_trainval_resnet152_run{}.json'

id_start = int(sys.argv[1])
id_end = int(sys.argv[2])

row_format = "{:<15} {:<15} {:<15} {:<15} {:<15}"
print(row_format.format("Index", "Threshold", "Activation", "Source_other", "mean_acc"))

with open('results.csv', 'w') as csvfile:
    writer = csv.writer(csvfile)

    for i in range(id_start, id_end):
        try:
            with open(file.format(i)) as f:
                dct = json.load(f)
            args = [i, dct['threshold'], dct['activation'], dct['other_in_source'], dct['mean_class_acc']]
            print(row_format.format(*args))
            writer.writerow(args)
        
        except:
            # happens when borgy job doesn't exist (so that we can give
            # large range and print all the ones that exist within this range)
            pass
        #print("{} doesn't exist".format(file.format(i)))
