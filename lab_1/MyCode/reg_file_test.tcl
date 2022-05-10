transcript on

set designName reg_file_tb
set moduleName reg_file
set projDir   C:/Users/Alex/Downloads/lab1/lab_1/lab_1/MyCode


cd $projDir
vlib work

vlog ./${moduleName}.v
vlog ./${moduleName}_tb.sv

vsim -L work -lib work -t ps -voptargs="+acc" ${moduleName}_tb;

#quit -sim
#add wave -unsigned *


configure wave -timelineunits ps