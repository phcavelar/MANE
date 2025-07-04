for disease in tcga_BLCA tcga_BRCA tcga_KIRC tcga_LUAD tcga_SKCM tcga_STAD tcga_UCEC
do
    python attention/Link_Prediction_unsup/main_Link_Prediction_unsup_MANE_Attention.py --nviews 5 --dataset $disease --input_graphs ./data/networks/ --output ./output/ --output_pairs ./data/pairs/ --read_pair -nepoch 32 1>${disease}.out 2>${disease}.err
done

python attention/Link_Prediction_unsup/main_Link_Prediction_unsup_MANE_Attention.py --nviews 2 --dataset kotliarov2020 --input_graphs ./data/networks/ --output ./output/ --output_pairs ./data/pairs/ --read_pair --num_walks 20 -nepoch 10 -bs 16384 -lr 0.001 # Or -lr 0.032 or -lr 0.064
# 1>kotliarov2020.out 2>kotliarov2020.err
#w/ num_walks=20...
#256 (default, with all the old inneficient code) ≃ 1:25:00/epoch=5100.528751134872s
#256 (default) ≃ 14:51/epoch, 0.8GiB VRAM
#8192 ≃ 3:10/epoch, 1.545GiB VRAM
#16384 ≃ 3:06/epoch, GiB VRAM
#65536 ≃ 4:00/epoch, 2.881GiB VRAM
#52117 ≃ 3:32/epoch, GiB VRAM
#208468 ≃ 4:00/epoch, GiB VRAM
# Run this if you've already calculated python attention/Link_Prediction_unsup/main_Link_Prediction_unsup_MANE_Attention.py --nviews 2 --dataset kotliarov2020 --input_graphs ./data/networks/ --output ./output/ --input_pairs ./data/pairs/ -nepoch 10 -bs 16384 -lr 0.064
