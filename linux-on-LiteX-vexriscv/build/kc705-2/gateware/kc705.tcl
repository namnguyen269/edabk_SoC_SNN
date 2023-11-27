
# Create Project

create_project -force -name kc705 -part xc7k325t-ffg900-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/RANCNetworkGrid_3x2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/buffer.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Core_3x2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Counter.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/CSRAM.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/ForwardEastWest.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/ForwardNorthSouth.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/FromLocal.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/LocalIn.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Merge2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Merge3.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/neuron_block.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/neuron_grid_3x2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/neuron_grid_controller.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/neuron_grid_datapath_3x2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/OutputBus.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/PathDecoder2Way.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/PathDecoder3Way.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Router.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/Scheduler.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/ranc3x2/SchedulerSRAM.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/load_param_fifo.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/PacketLoader.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/SNN_3x2.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/sync_2ff.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/tick_gen.v}
read_verilog -v {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/tb_sequence.sv}
set_property file_type SystemVerilog [get_files {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/tb_sequence.sv}]
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/async_fifo.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/fifomem.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/rptr_empty.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/sync_ptr.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/sync_r2w.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/sync_w2r.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/ranc_sequence/async_fifo/wptr_full.v}
read_verilog {/home/riolet/litex/pythondata-cpu-vexriscv-smp/pythondata_cpu_vexriscv_smp/verilog/Ram_1w_1rs_Generic.v}
read_verilog {/home/riolet/litex/pythondata-cpu-vexriscv-smp/pythondata_cpu_vexriscv_smp/verilog/VexRiscvLitexSmpCluster_Cc2_Iw64Is8192Iy2_Dw64Ds8192Dy2_ITs4DTs4_Cdma_Ood_Wm.v}
read_verilog {/home/riolet/litex/linux-on-LiteX-vexriscv/build/kc705/gateware/kc705.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc kc705.xdc
set_property PROCESSING_ORDER EARLY [get_files kc705.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top kc705 -part xc7k325t-ffg900-2

# Synthesis report

report_timing_summary -file kc705_timing_synth.rpt
report_utilization -hierarchical -file kc705_utilization_hierarchical_synth.rpt
report_utilization -file kc705_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file kc705_utilization_hierarchical_place.rpt
report_utilization -file kc705_utilization_place.rpt
report_io -file kc705_io.rpt
report_control_sets -verbose -file kc705_control_sets.rpt
report_clock_utilization -file kc705_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force kc705_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file kc705_route_status.rpt
report_drc -file kc705_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file kc705_timing.rpt
report_power -file kc705_power.rpt
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# Bitstream generation

write_bitstream -force kc705.bit 
write_cfgmem -force -format bin -interface spix4 -size 16 -loadbit "up 0x0 kc705.bit" -file kc705.bin

# End

quit