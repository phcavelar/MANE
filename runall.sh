for disease in tcga_BLCA tcga_BRCA tcga_KIRC tcga_LUAD tcga_SKCM tcga_STAD tcga_UCEC
do
    python attention/Link_Prediction_unsup/main_Link_Prediction_unsup_MANE_Attention.py --nviews 5 --dataset $disease --input_graphs ./data/networks/ --output ./output/ --output_pairs ./data/pairs/ --read_pair -nepoch 32 1>${disease}.out 2>${disease}.err
done

python attention/Link_Prediction_unsup/main_Link_Prediction_unsup_MANE_Attention.py --nviews 2 --dataset kotliarov2020 --input_graphs ./data/networks/ --output ./output/ --output_pairs ./data/pairs/ --read_pair -nepoch 32 1>kotliarov2020.out 2>kotliarov2020.err
