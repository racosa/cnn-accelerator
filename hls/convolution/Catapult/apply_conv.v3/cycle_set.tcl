
# Loop constraints
directive set /apply_conv/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /apply_conv/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /apply_conv/core/core:rlp/main/PAD CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for CSTEPS_FROM {{. == 1} {.. == 0}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for CSTEPS_FROM {{. == 4} {.. == 0}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE CSTEPS_FROM {{. == 1} {.. == 0}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:oif:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:if:PAD:for:for:if:mul CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:if:mul CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:if:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:if:write_mem(pad_input:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:oif:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:if:acc CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:if:write_mem(pad_input:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc#11 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc#12 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:mul#7 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:read_mem(conv_in:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:acc CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:else:else:write_mem(pad_input:rsc.@) CSTEPS_FROM {{.. == 3}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:for/PAD:for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:for/PAD:for:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/PAD/PAD:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_H:CONV_K_H:and CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mul CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mul#11 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:read_mem(pad_input:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#20 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mul#12 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:asn(pref:pref.pref#4(6:CONV_K_W:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mux#3 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mul#10 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_H:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_H:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mux CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/and#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_W:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_D:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_D:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_H:mux#2 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/and CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_K_D/CONV_K_H:mux#5 CSTEPS_FROM {{.. == 2}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:else:if:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:mux CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:CONV_H_SLIDE:and CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:mul CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:write_mem(conv_out:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_H_SLIDE/CONV_H_SLIDE:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_V_SLIDE:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_V_SLIDE:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_V_SLIDE/CONV_V_SLIDE:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_NB_K:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_NB_K:acc CSTEPS_FROM {{.. == 1}}
directive set /apply_conv/core/core:rlp/main/CONV_NB_K/CONV_NB_K:acc#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
