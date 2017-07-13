#!/bin/sh

# this configurations corresponds to the one obtaining a cross-entropy of 43.52 in Miceli Barone et al. (2017).

mydir=`dirname $0`

cd $mydir

python $nematus/nmt.py \
    --model $working_dir/model.npz \
    --datasets $working_dir/corpus.bpe.$src $working_dir/corpus.bpe.$tgt \
    --valid_datasets $working_dir/newstest2013.bpe.$src $working_dir/newstest2013.bpe.$tgt \
    --dictionaries $working_dir/corpus.bpe.$src.json $working_dir/corpus.bpe.$tgt.json \
    --external_validation_script $working_dir/scripts/validate.sh \
    --reload \
    --dim_word 512 \
    --dim 1024 \
    --lrate 0.0001 \
    --optimizer adam \
    --maxlen 50 \
    --batch_size 80 \
    --valid_batch_size 40 \
    --validFreq 10000 \
    --dispFreq 1000 \
    --saveFreq 30000 \
    --sampleFreq 10000 \
    --tie_decoder_embeddings \
    --enc_depth 2 \
    --dec_depth 2 \
    --dec_deep_context \
    --layer_normalisation \
    --enc_recurrence_transition_depth 2 \
    --dec_base_recurrence_transition_depth 4 \
    --dec_high_recurrence_transition_depth 2
