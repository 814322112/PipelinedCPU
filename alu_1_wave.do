onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_1_testbench/a
add wave -noupdate /alu_1_testbench/b
add wave -noupdate /alu_1_testbench/Cin
add wave -noupdate /alu_1_testbench/Cout
add wave -noupdate /alu_1_testbench/result
add wave -noupdate /alu_1_testbench/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {661 ps} 0}
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
WaveRestoreZoom {0 ps} {8 ns}
