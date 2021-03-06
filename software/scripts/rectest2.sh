#!/bin/bash
cd $(dirname $(realpath $0))    # change into script dir


#./mat4_conf.sh 0 0.5 0.5 0  0 0 0 1  0 0.5 0.5 0  1 0 0 0
#for n in `seq 0 8`; do sleep 0.8; scn_reg 31 0x${n}01; done
#./mat4_conf.sh 0 0 1 0  0 0 0 1  0 1 0 0  1 0 0 0
#for n in `seq 0 8`; do sleep 0.8; scn_reg 31 0x${n}01; done
#./mat4_conf.sh 0 1 0 0  0 0 0 1  0 0 1 0  1 0 0 0
#for n in `seq 0 8`; do sleep 0.8; scn_reg 31 0x${n}01; done

for t in 1 2 3 4; do

    ../processing_tools/mimg/mimg -a -T $t

    ./mat4_conf.sh 0 0.5 0.5 0  0 0 0 1  0 0.5 0.5 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
    ./mat4_conf.sh 0 0 1 0  0 0 0 1  0 1 0 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
    ./mat4_conf.sh 0 1 0 0  0 0 0 1  0 0 1 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
	
done

for f in /opt/overlays/*.raw.xz; do

    xzcat $f | ../processing_tools/mimg/mimg -r -w    

    ./mat4_conf.sh 0 0.5 0.5 0  0 0 0 1  0 0.5 0.5 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
    ./mat4_conf.sh 0 0 1 0  0 0 0 1  0 1 0 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
    ./mat4_conf.sh 0 1 0 0  0 0 0 1  0 0 1 0  1 0 0 0
    for n in `seq 0 8`; do sleep 0.2; scn_reg 31 0x${n}01; done
	
done

