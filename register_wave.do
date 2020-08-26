onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_testbench/datain
add wave -noupdate /register_testbench/dataout
add wave -noupdate /register_testbench/clk
add wave -noupdate /register_testbench/writeen
add wave -noupdate /register_testbench/dut/dffout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7541 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1936 ps} {18320 ps}
