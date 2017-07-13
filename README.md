# Deep Architectures for Neural Machine Translation

This repository contains Nematus shell training scripts to train deep neural machine translation models as described in the paper:
Miceli Barone, A. V.; Helcl, J.; Sennrich, R.; Haddow, B.; Birch, A.; "Deep Architectures for Neural Machine Translation". Proceedings of the Second Conference on Machine Translation, 2017.

## Dependencies

Nematus: https://github.com/EdinburghNLP/nematus

the crGRU decoder is available in commit d9a13ef8f79af49525fc17b5b1270ebd5ce1c195;
all other variants are available in the Nematus master branch.

## Depth-related options

### Deep transition

--enc_recurrence_transition_depth N           # number of GRU transition operations applied in the encoder. Minimum is 1. (Only applies to gru). (default: 1)

--dec_base_recurrence_transition_depth N      # number of GRU transition operations applied in the first level of the decoder. Minimum is 2.  (Only applies to gru_cond). (default: 2)

### Stacked encoder

--enc_depth N                                 # number of encoder stacking levels (default 1)

--enc_depth_bidirectional N                   # number of alternating bidirectional encoder levels; if enc_depth is greater, remaining the layers are unidirectional; set this to 1 to obtain the "biunidirectional" encoder (default: equal to enc_depth)

### Stacked decoder

--decoder_deep gru | gru_cond | gru_cond_reuse_att  # in combination with dec_deep_context specifies the decoder cell type for decoder levels higher than the first one. These correspond to the following cell types in the paper: gru -> GRU; gru_cond -> cGRU; gru_cond_reuse_att -> crGRU

--dec_deep_context                            # use a rGRU decoder cell rather than a GRU

--dec_depth N                                 # number of decoder stacking levels (default: 1)

### Bideep encoder

No special parameters, just use the parameters of deep transition and stacked encoders in combination

### Bideep decoder

--dec_high_recurrence_transition_depth N      # number of GRU transition operations applied in the higher levels of the decoder when it is stacked. Minimum is 1. (Only applies to gru). (default: 1)
