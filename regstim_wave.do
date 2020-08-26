onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /regstim/ReadRegister1
add wave -noupdate -radix hexadecimal /regstim/ReadRegister2
add wave -noupdate -radix hexadecimal /regstim/WriteRegister
add wave -noupdate -radix hexadecimal /regstim/WriteData
add wave -noupdate -radix hexadecimal /regstim/RegWrite
add wave -noupdate -radix hexadecimal /regstim/clk
add wave -noupdate -radix hexadecimal /regstim/ReadData1
add wave -noupdate -radix hexadecimal /regstim/ReadData2
add wave -noupdate -radix hexadecimal -childformat {{{/regstim/dut/w[63]} -radix hexadecimal} {{/regstim/dut/w[62]} -radix hexadecimal} {{/regstim/dut/w[61]} -radix hexadecimal} {{/regstim/dut/w[60]} -radix hexadecimal} {{/regstim/dut/w[59]} -radix hexadecimal} {{/regstim/dut/w[58]} -radix hexadecimal} {{/regstim/dut/w[57]} -radix hexadecimal} {{/regstim/dut/w[56]} -radix hexadecimal} {{/regstim/dut/w[55]} -radix hexadecimal} {{/regstim/dut/w[54]} -radix hexadecimal} {{/regstim/dut/w[53]} -radix hexadecimal} {{/regstim/dut/w[52]} -radix hexadecimal} {{/regstim/dut/w[51]} -radix hexadecimal} {{/regstim/dut/w[50]} -radix hexadecimal} {{/regstim/dut/w[49]} -radix hexadecimal} {{/regstim/dut/w[48]} -radix hexadecimal} {{/regstim/dut/w[47]} -radix hexadecimal} {{/regstim/dut/w[46]} -radix hexadecimal} {{/regstim/dut/w[45]} -radix hexadecimal} {{/regstim/dut/w[44]} -radix hexadecimal} {{/regstim/dut/w[43]} -radix hexadecimal} {{/regstim/dut/w[42]} -radix hexadecimal} {{/regstim/dut/w[41]} -radix hexadecimal} {{/regstim/dut/w[40]} -radix hexadecimal} {{/regstim/dut/w[39]} -radix hexadecimal} {{/regstim/dut/w[38]} -radix hexadecimal} {{/regstim/dut/w[37]} -radix hexadecimal} {{/regstim/dut/w[36]} -radix hexadecimal} {{/regstim/dut/w[35]} -radix hexadecimal} {{/regstim/dut/w[34]} -radix hexadecimal} {{/regstim/dut/w[33]} -radix hexadecimal} {{/regstim/dut/w[32]} -radix hexadecimal} {{/regstim/dut/w[31]} -radix hexadecimal} {{/regstim/dut/w[30]} -radix hexadecimal} {{/regstim/dut/w[29]} -radix hexadecimal} {{/regstim/dut/w[28]} -radix hexadecimal} {{/regstim/dut/w[27]} -radix hexadecimal} {{/regstim/dut/w[26]} -radix hexadecimal} {{/regstim/dut/w[25]} -radix hexadecimal} {{/regstim/dut/w[24]} -radix hexadecimal} {{/regstim/dut/w[23]} -radix hexadecimal} {{/regstim/dut/w[22]} -radix hexadecimal} {{/regstim/dut/w[21]} -radix hexadecimal} {{/regstim/dut/w[20]} -radix hexadecimal} {{/regstim/dut/w[19]} -radix hexadecimal} {{/regstim/dut/w[18]} -radix hexadecimal} {{/regstim/dut/w[17]} -radix hexadecimal} {{/regstim/dut/w[16]} -radix hexadecimal} {{/regstim/dut/w[15]} -radix hexadecimal} {{/regstim/dut/w[14]} -radix hexadecimal} {{/regstim/dut/w[13]} -radix hexadecimal} {{/regstim/dut/w[12]} -radix hexadecimal} {{/regstim/dut/w[11]} -radix hexadecimal} {{/regstim/dut/w[10]} -radix hexadecimal} {{/regstim/dut/w[9]} -radix hexadecimal} {{/regstim/dut/w[8]} -radix hexadecimal} {{/regstim/dut/w[7]} -radix hexadecimal} {{/regstim/dut/w[6]} -radix hexadecimal} {{/regstim/dut/w[5]} -radix hexadecimal} {{/regstim/dut/w[4]} -radix hexadecimal} {{/regstim/dut/w[3]} -radix hexadecimal} {{/regstim/dut/w[2]} -radix hexadecimal} {{/regstim/dut/w[1]} -radix hexadecimal} {{/regstim/dut/w[0]} -radix hexadecimal}} -subitemconfig {{/regstim/dut/w[63]} {-radix hexadecimal} {/regstim/dut/w[62]} {-radix hexadecimal} {/regstim/dut/w[61]} {-radix hexadecimal} {/regstim/dut/w[60]} {-radix hexadecimal} {/regstim/dut/w[59]} {-radix hexadecimal} {/regstim/dut/w[58]} {-radix hexadecimal} {/regstim/dut/w[57]} {-radix hexadecimal} {/regstim/dut/w[56]} {-radix hexadecimal} {/regstim/dut/w[55]} {-radix hexadecimal} {/regstim/dut/w[54]} {-radix hexadecimal} {/regstim/dut/w[53]} {-radix hexadecimal} {/regstim/dut/w[52]} {-radix hexadecimal} {/regstim/dut/w[51]} {-radix hexadecimal} {/regstim/dut/w[50]} {-radix hexadecimal} {/regstim/dut/w[49]} {-radix hexadecimal} {/regstim/dut/w[48]} {-radix hexadecimal} {/regstim/dut/w[47]} {-radix hexadecimal} {/regstim/dut/w[46]} {-radix hexadecimal} {/regstim/dut/w[45]} {-radix hexadecimal} {/regstim/dut/w[44]} {-radix hexadecimal} {/regstim/dut/w[43]} {-radix hexadecimal} {/regstim/dut/w[42]} {-radix hexadecimal} {/regstim/dut/w[41]} {-radix hexadecimal} {/regstim/dut/w[40]} {-radix hexadecimal} {/regstim/dut/w[39]} {-radix hexadecimal} {/regstim/dut/w[38]} {-radix hexadecimal} {/regstim/dut/w[37]} {-radix hexadecimal} {/regstim/dut/w[36]} {-radix hexadecimal} {/regstim/dut/w[35]} {-radix hexadecimal} {/regstim/dut/w[34]} {-radix hexadecimal} {/regstim/dut/w[33]} {-radix hexadecimal} {/regstim/dut/w[32]} {-radix hexadecimal} {/regstim/dut/w[31]} {-radix hexadecimal} {/regstim/dut/w[30]} {-radix hexadecimal} {/regstim/dut/w[29]} {-radix hexadecimal} {/regstim/dut/w[28]} {-radix hexadecimal} {/regstim/dut/w[27]} {-radix hexadecimal} {/regstim/dut/w[26]} {-radix hexadecimal} {/regstim/dut/w[25]} {-radix hexadecimal} {/regstim/dut/w[24]} {-radix hexadecimal} {/regstim/dut/w[23]} {-radix hexadecimal} {/regstim/dut/w[22]} {-radix hexadecimal} {/regstim/dut/w[21]} {-radix hexadecimal} {/regstim/dut/w[20]} {-radix hexadecimal} {/regstim/dut/w[19]} {-radix hexadecimal} {/regstim/dut/w[18]} {-radix hexadecimal} {/regstim/dut/w[17]} {-radix hexadecimal} {/regstim/dut/w[16]} {-radix hexadecimal} {/regstim/dut/w[15]} {-radix hexadecimal} {/regstim/dut/w[14]} {-radix hexadecimal} {/regstim/dut/w[13]} {-radix hexadecimal} {/regstim/dut/w[12]} {-radix hexadecimal} {/regstim/dut/w[11]} {-radix hexadecimal} {/regstim/dut/w[10]} {-radix hexadecimal} {/regstim/dut/w[9]} {-radix hexadecimal} {/regstim/dut/w[8]} {-radix hexadecimal} {/regstim/dut/w[7]} {-radix hexadecimal} {/regstim/dut/w[6]} {-radix hexadecimal} {/regstim/dut/w[5]} {-radix hexadecimal} {/regstim/dut/w[4]} {-radix hexadecimal} {/regstim/dut/w[3]} {-radix hexadecimal} {/regstim/dut/w[2]} {-radix hexadecimal} {/regstim/dut/w[1]} {-radix hexadecimal} {/regstim/dut/w[0]} {-radix hexadecimal}} /regstim/dut/w
add wave -noupdate /regstim/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {317444983 ps} 0}
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
WaveRestoreZoom {0 ps} {131072 ns}
