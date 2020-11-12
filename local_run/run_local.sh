
#! /bin/sh
source $TestArea/../build/*/setup.sh

Reco_tf.py --outputAODFile=AOD.pool.root --steering="doRDO_TRIG" --preExec="all:from TriggerJobOpts.TriggerFlags import TriggerFlags; TriggerFlags.AODEDMSet.set_Value_and_Lock(\"AODFULL\");TriggerFlags.generateMenuDiagnostics.set_Value_and_Lock(True);" --athenaopts="--imf --perfmon --threads=1" --maxEvents=50 --inputRDOFile=/gpfs/fs7001/youhei/L2MuonSA/dataset_rdo/mc16_13TeV.300901.ParticleGunEvtGen_Jpsi_mu3p5mu3p5_prompt.merge.RDO.e7406_e5984_a875_r11558//RDO.18953286._000022.pool.root.1 --postInclude ../testConf.py
