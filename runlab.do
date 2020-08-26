# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./fullAdder.sv"
vlog "./zero_flag.sv"
vlog "./mux8_1.sv"
vlog "./mux4_1.sv"
vlog "./alu_1.sv"
vlog "./alu_64.sv"
vlog "./nor16_1.sv"
vlog "./alustim.sv"
vlog "./cpu.sv"
vlog "./controlLogic.sv"
vlog "./mux128_64.sv"
vlog "./instructmem.sv"
vlog "./signExtend.sv"
vlog "./mux5bit.sv"
vlog "./datamem.sv"
vlog "./regfile.sv"
vlog "./register.sv"
vlog "./D_FF.sv"
vlog "./math.sv"
vlog "./fullAdder_64.sv"
vlog "./d5_32_decoder.sv"
vlog "./d3_8_decoder.sv"
vlog "./d2_4_decoder.sv"
vlog "./d1_2_decoder.sv"
vlog "./mux32_1.sv"
vlog "./mux16_1.sv"
vlog "./register2.sv"
vlog "./mux4_1_64.sv"
# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
#vsim -voptargs="+acc" -t 1ps -lib work alustim
#vsim -voptargs="+acc" -t 1ps -lib work alu_1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux8_1_testbench
vsim -voptargs="+acc" -t 1ps -lib work cpu_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do alustim_wave.do
#do alu_1_wave.do
do cpu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
