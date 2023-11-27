module SNN_3x2 #(
    parameter WIDTH = 30
) (
    input               clk                 ,   //snn clock
    input               reset_n             ,   //snn resetn
    input               sys_clk             ,   //cpu clock
    input               sys_reset_n         ,   //cpu resetn

    input   [2:0]       next_core           ,   //state of core that loading parameter
    input   [367:0]     parameter_in        ,   //parameter in
    input               param_winc          ,   //param write enable
    output              param_wfull         ,

    input   [1:0]       neuron_inst_wdata   ,   //neuron instruction
    input               neuron_inst_winc    ,   //neuron_inst write enable
    output              neuron_inst_wfull   ,

    input               packet_winc         ,   //packet in write enable
    input   [29:0]      packet_wdata        ,   //packet in from cpu
    output              packet_wfull        ,

    input               packet_out_rinc     ,
    output              packet_out_rempty   ,
    output  [7:0]       packet_out          ,

    input               spike_out_rinc      ,
    output  [249:0]     spike_out           ,
    output              spike_out_rempty    ,

    output  [15:0]      msb_param_snn       ,
    input               spike_en            ,   //spike out enable
    input               load_end            ,   //done loading packet
    output              next_core_en        ,
    output              tick_ready          ,   //tick for system
    output              complete            ,   //all process complete
    output  [2:0]       grid_state              //neuron grid controller state
);

    wire                ren_to_input_buffer                 ;    
    wire                input_buffer_empty                  ;
    wire    [2:0]       state                               ;
    wire    [29:0] 		packet_in			                ;
    wire                forward_north_local_buffer_empty_all;

    wire                complete_sync                       ;
    wire    [2:0]       next_core_sync                      ;
    wire                spike_en_sync                       ;
    wire                load_end_sync                       ;
    wire    [2:0]       grid_state_sync                     ;
    wire                tick_ready_sync                     ;
    wire    [15:0]      msb_param                           ;

    wire    [249:0]     spike_out_sync                      ;
    wire                spike_out_wfull                     ;
    wire                spike_winc                          ;

    wire                packet_out_valid                    ;
    wire	[7:0]       packet_out_snn                      ;
    wire                packet_out_wfull                    ;

    sync_2ff  #(
        .ASIZE  (3)
    ) next_core_sync_inst(
        .dest_clk   (clk),
        .dest_rst_n (reset_n),
        .src_ptr    (next_core),
        .dest_ptr   (next_core_sync)
    );
    
    sync_2ff  #(
        .ASIZE  (1)
    ) spike_en_sync_inst(
        .dest_clk   (clk),
        .dest_rst_n (reset_n),
        .src_ptr    (spike_en),
        .dest_ptr   (spike_en_sync)
    );

    sync_2ff  #(
        .ASIZE  (1)
    ) load_end_sync_inst(
        .dest_clk   (clk),
        .dest_rst_n (reset_n),
        .src_ptr    (load_end),
        .dest_ptr   (load_end_sync)
    );

    sync_2ff  #(
        .ASIZE  (1)
    ) tick_ready_sync_inst(
        .dest_clk   (sys_clk),
        .dest_rst_n (sys_reset_n),
        .src_ptr    (tick_ready_sync),
        .dest_ptr   (tick_ready)
    );

    sync_2ff  #(
        .ASIZE  (1)
    ) complete_sync_inst(
        .dest_clk   (sys_clk),
        .dest_rst_n (sys_reset_n),
        .src_ptr    (complete_sync),
        .dest_ptr   (complete)
    );

    sync_2ff  #(
        .ASIZE  (3)
    ) grid_state_sync_inst(
        .dest_clk   (sys_clk),
        .dest_rst_n (sys_reset_n),
        .src_ptr    (grid_state_sync),
        .dest_ptr   (grid_state)
    );

    // sync_2ff  #(
    //     .ASIZE  (250)
    // ) spike_out_sync_inst(
    //     .dest_clk   (sys_clk),
    //     .dest_rst_n (sys_reset_n),
    //     .src_ptr    (spike_out_sync),
    //     .dest_ptr   (spike_out)
    // );

    sync_2ff  #(
        .ASIZE  (16)
    ) msb_param_inst(
        .dest_clk   (sys_clk),
        .dest_rst_n (sys_reset_n),
        .src_ptr    (msb_param),
        .dest_ptr   (msb_param_snn)
    );

    async_fifo #(
		.DSIZE      (8      ), 
		.ASIZE      (8      ),
		.FALLTHROUGH("TRUE")
	) packet_out_fifo(
		.wclk   (clk                                 ),
		.wrst_n (reset_n                             ),
		.winc   (packet_out_valid & ~packet_out_wfull),
		.wdata  (packet_out_snn                      ),
		.wfull  (packet_out_wfull                    ),
		.awfull (                                    ),
		.rclk   (sys_clk                             ),
		.rrst_n (sys_reset_n                         ),
		.rinc   (packet_out_rinc                     ),
		.rdata  (packet_out                          ),
		.rempty (packet_out_rempty                   ),
		.arempty(                                    )
	);

    async_fifo #(
		.DSIZE      (250    ), 
		.ASIZE      (3      ),
		.FALLTHROUGH("TRUE")
    ) spike_out_fifo(
		.wclk   (clk                                 ),
		.wrst_n (reset_n                             ),
		.winc   (spike_winc                          ),
		.wdata  (spike_out_sync                      ),
		.wfull  (spike_out_wfull                     ),
		.awfull (                                    ),
		.rclk   (sys_clk                             ),
		.rrst_n (sys_reset_n                         ),
		.rinc   (spike_out_rinc                      ),
		.rdata  (spike_out                           ),
		.rempty (spike_out_rempty                    ),
		.arempty(                                    )
	);

    load_packet packet_loader(
		.clk                   	(clk                    ),
		.reset_n               	(reset_n                ),
		.sys_clk               	(sys_clk                ),
		.sys_reset_n           	(reset_n                ),
		.ren_to_input_buffer	(ren_to_input_buffer	),
		.tick              		(tick_ready_sync    	),
		.packet_out_valid  		(packet_out_valid		),
		.packet_out        		(packet_out_snn			),
		.grid_state        		(grid_state_sync   		),
		.packet_winc            (packet_winc            ),
        .packet_wdata           (packet_wdata           ),
        .spike_en               (spike_en_sync          ),
        .load_end               (load_end_sync          ),
        .packet_wfull           (packet_wfull           ),
		.input_buffer_empty		(input_buffer_empty		),
		.complete          		(complete_sync  		),
		.state             		(state					),
        .spike_winc             (spike_winc             ),
		.spike_out         		(spike_out_sync 		),
		.packet_in				(packet_in				)
	);

    RANCNetworkGrid_3x2 RANCNetworkGrid_3x2_ins(
        .clk                   	                (clk                                    ),
		.reset_n               	                (reset_n                                ),
        .sys_clk                                (sys_clk                                ),
        .sys_reset_n                            (sys_reset_n                            ),
        .next_core                              (next_core_sync                         ),
        .next_core_en                           (next_core_en                           ),
        .parameter_in                           (parameter_in                           ),
        .param_winc                             (param_winc                             ),
        .neuron_inst_wdata                      (neuron_inst_wdata                      ),
        .neuron_inst_winc                       (neuron_inst_winc                       ),
        .tick                                   (tick_ready_sync                        ),
        .input_buffer_empty                     (input_buffer_empty                     ),
        .packet_in                              (packet_in                              ),
        .packet_out                             (packet_out_snn                         ),
        .packet_out_valid                       (packet_out_valid                       ),
        .ren_to_input_buffer                    (ren_to_input_buffer                    ),
        .grid_state                             (grid_state_sync                        ),
        .forward_north_local_buffer_empty_all   (forward_north_local_buffer_empty_all   ),
        .param_wfull                            (param_wfull                            ),
        .neuron_inst_wfull                      (neuron_inst_wfull                      ),
        .msb_param                              (msb_param                              )

	);

    tick_gen tick_generation(
        .clk                   	                (clk                                    ),
		.rst_n               	                (reset_n                                ),
        .state                                  (state                                  ),
        .grid_state                             (grid_state_sync                        ),
        .input_buffer_empty                     (input_buffer_empty                     ),
        .forward_north_local_buffer_empty_all   (forward_north_local_buffer_empty_all   ),
        .complete                               (complete_sync                          ),
        .tick                                   (tick_ready_sync                        )
    );

endmodule