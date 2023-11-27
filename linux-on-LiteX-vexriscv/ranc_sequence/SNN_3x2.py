from sqlite3 import complete_statement
from migen import *

from litex.soc.interconnect.csr import *

from litex.soc.interconnect.csr_eventmanager import *

from litex.soc.integration.doc import AutoDoc, ModuleDoc

class snn_3x2(Module, AutoCSR, AutoDoc):
    def __init__(self, platform):
        self.intro = ModuleDoc(""" SNN 3x2 """)

        self.clk = Signal()


        self.next_core    = CSRStorage(name="next_core",description='Core number will be load parameter', reset=0x0, size=3)
        self.param_wdata  = Signal(368)
        self.param0       = CSRStorage(name="param_wdata0",description='Param data0 send SNN', reset=0x0, size=32)
        self.param1       = CSRStorage(name="param_wdata1",description='Param data1 send SNN', reset=0x0, size=32)
        self.param2       = CSRStorage(name="param_wdata2",description='Param data2 send SNN', reset=0x0, size=32)
        self.param3       = CSRStorage(name="param_wdata3",description='Param data3 send SNN', reset=0x0, size=32)
        self.param4       = CSRStorage(name="param_wdata4",description='Param data4 send SNN', reset=0x0, size=32)
        self.param5       = CSRStorage(name="param_wdata5",description='Param data5 send SNN', reset=0x0, size=32)
        self.param6       = CSRStorage(name="param_wdata6",description='Param data6 send SNN', reset=0x0, size=32)
        self.param7       = CSRStorage(name="param_wdata7",description='Param data7 send SNN', reset=0x0, size=32)
        self.param8       = CSRStorage(name="param_wdata8",description='Param data8 send SNN', reset=0x0, size=32)
        self.param9       = CSRStorage(name="param_wdata9",description='Param data9 send SNN', reset=0x0, size=32)
        self.param10      = CSRStorage(name="param_wdata10",description='Param data10 send SNN', reset=0x0, size=32)
        self.param11      = CSRStorage(name="param_wdata11",description='Param data11 send SNN', reset=0x0, size=16)

        self.neuron_inst        = CSRStorage(name="neuron_inst_wdata",description='neuron_inst data send SNN', reset=0x0, size=2)

        self.packet_wdata       = CSRStorage(name="packet_wdata",description='Packet data send SNN', reset=0x0, size=30)

        self.spike_en           = CSRStorage(name="spike_en",description='Enable signal to shoot spike out', reset=0x0, size=1)
        self.load_end           = CSRStorage(name="load_end",description='Signal notify that process ', reset=0x0, size=1)
        self.tick_ready         = CSRStorage(name="tick_ready",description='tick_ready', reset=0x0, size=1, write_from_dev=True)
        self.complete           = CSRStorage(name="complete",description='Complete process', reset=0x0, size=1, write_from_dev=True)
        self.next_core_en       = CSRStorage(name="next_core_en",description='Enable next core to load param', reset=0x0, size=1, write_from_dev=True)
        self.grid_state         = CSRStorage(name="grid_state",description='Grid state of SNN', reset=0x0, size=3, write_from_dev=True)
        self.msb_param_snn      = CSRStorage(name="msb_param_snn",description='msb_param_snn from SNN', reset=0x0, size=16, write_from_dev=True)

        # self.spike_out          = CSRStorage(name="spike_out",description='Spike out from SNN', reset=0x0, size=250, write_from_dev=True)
        self.spike_out          = Signal(256)
        self.spike_out0         = CSRStorage(name="spike_out0",description='Spike out 0 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out1         = CSRStorage(name="spike_out1",description='Spike out 1 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out2         = CSRStorage(name="spike_out2",description='Spike out 2 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out3         = CSRStorage(name="spike_out3",description='Spike out 3 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out4         = CSRStorage(name="spike_out4",description='Spike out 4 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out5         = CSRStorage(name="spike_out5",description='Spike out 5 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out6         = CSRStorage(name="spike_out6",description='Spike out 6 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out7         = CSRStorage(name="spike_out7",description='Spike out 7 from SNN', reset=0x0, size=32, write_from_dev=True)
        self.spike_out_rinc     = CSRStorage(name="spike_out_rinc",description='Enable signal read spike out data', reset=0x0, size=1)

        self.packet_out         = CSRStorage(name="packet_out",description='Packet_out from SNN', reset=0x0, size=8, write_from_dev=True)
        self.packet_out_rinc    = CSRStorage(name="packet_out_rinc",description='Enable signal read packet out data', reset=0x0, size=1)

        self.snn_status = CSRStatus(size=32, fields=[
            CSRField(name="packet_wfull", description="flag full", size=1, reset=0x0),
            CSRField(name="param_wfull", description="flag full", size=1, reset=0x0),
            CSRField(name="neuron_inst_wfull", description="flag full", size=1, reset=0x0),
            CSRField(name="packet_out_rempty", description="Packet out data is empty", size=1, reset=0x0),
            CSRField(name="spike_out_rempty", description="Spike out data is empty", size=1, reset=0x0),
        ], description="SNN status")

        self.comb += self.next_core_en.we.eq(1)
        self.comb += self.grid_state.we.eq(1)
        self.comb += self.tick_ready.we.eq(1)
        self.comb += self.complete.we.eq(1)
        self.comb += self.spike_out0.we.eq(1)
        self.comb += self.spike_out1.we.eq(1)
        self.comb += self.spike_out2.we.eq(1)
        self.comb += self.spike_out3.we.eq(1)
        self.comb += self.spike_out4.we.eq(1)
        self.comb += self.spike_out5.we.eq(1)
        self.comb += self.spike_out6.we.eq(1)
        self.comb += self.spike_out7.we.eq(1)
        self.comb += self.msb_param_snn.we.eq(1)
        self.comb += self.packet_out.we.eq(1)

        self.comb += self.param_wdata.eq(Cat(self.param0.storage, 
            self.param1.storage , 
            self.param2.storage , 
            self.param3.storage , 
            self.param4.storage , 
            self.param5.storage , 
            self.param6.storage , 
            self.param7.storage , 
            self.param8.storage , 
            self.param9.storage , 
            self.param10.storage,
            self.param11.storage 
        ))

        self.comb += Cat(self.spike_out0.dat_w, 
                        self.spike_out1.dat_w, 
                        self.spike_out2.dat_w,
                        self.spike_out3.dat_w,
                        self.spike_out4.dat_w,
                        self.spike_out5.dat_w,
                        self.spike_out6.dat_w,
                        self.spike_out7.dat_w).eq(self.spike_out)

        self.specials += Instance(
            "SNN_3x2"                                           ,
            i_clk               = self.clk                      ,
            i_reset_n           = ~ResetSignal()                ,
            i_sys_clk           = ClockSignal()                 ,
            i_sys_reset_n       = ~ResetSignal()                ,

            i_next_core         = self.next_core.storage        ,
            i_parameter_in      = self.param_wdata              ,
            i_param_winc        = self.param11.re               ,
            o_param_wfull       = self.snn_status.fields.param_wfull,

            i_neuron_inst_wdata = self.neuron_inst.storage      ,
            i_neuron_inst_winc  = self.neuron_inst.re           ,
            o_neuron_inst_wfull = self.snn_status.fields.neuron_inst_wfull,

            i_packet_winc       = self.packet_wdata.re          ,
            i_packet_wdata      = self.packet_wdata.storage     ,
            o_packet_wfull      = self.snn_status.fields.packet_wfull,

            i_spike_en          = self.spike_en.storage         ,
            i_load_end          = self.load_end.storage         ,
            o_next_core_en      = self.next_core_en.dat_w       ,
            o_tick_ready        = self.tick_ready.dat_w         ,
            o_complete          = self.complete.dat_w           ,
            o_grid_state        = self.grid_state.dat_w         ,
            o_msb_param_snn     = self.msb_param_snn.dat_w      ,

            i_packet_out_rinc   = self.packet_out_rinc.re       ,
            o_packet_out        = self.packet_out.dat_w         ,
            o_packet_out_rempty = self.snn_status.fields.packet_out_rempty,

            i_spike_out_rinc    = self.spike_out_rinc.re         ,
            o_spike_out         = self.spike_out                ,
            o_spike_out_rempty  = self.snn_status.fields.spike_out_rempty
        )

        platform.add_source_dir("./ranc_sequence/ranc3x2")
        platform.add_source_dir("./ranc_sequence")
        platform.add_source_dir("./ranc_sequence/async_fifo")


            


