`timescale 1ns/1ps
module top ();
	parameter NUM_OUTPUT = 250; // Số spike bắn ra
//	parameter NUM_PICTURE = 10; // Số ảnh test
//	parameter NUM_PACKET = 5331; // số lượng input packet trong file
	//parameter NUM_PICTURE = 100; // Số ảnh test
	//parameter NUM_PACKET = 13910; // số lượng input packet trong file
	parameter NUM_PICTURE = 4; // Số ảnh test
	parameter NUM_PACKET = 549;
	
	reg clk, sys_clk, reset_n, sys_rst, csr_rst, sys_reset_n;

	reg                 param_winc        	;
	reg		[367:0]		parameter_in		;
	wire				param_wfull			;
	reg		[2:0]		next_core			;

	reg                 neuron_inst_winc 	;
	reg 	[1:0]       neuron_inst_wdata	;
	wire				neuron_inst_wfull	;

	reg					packet_winc 		;
	reg		[29:0]		packet_wdata		;
	wire				packet_wfull		;

	reg					spike_en    		;
	reg					load_end    		;
	wire				tick				;
    wire                complete            ;
	wire				next_core_en		;
	wire	[2:0]		grid_state			;

	reg 				packet_out_rinc		;
	wire				packet_out_rempty	;
	wire	[7:0]		packet_out			;

	reg					spike_out_rinc		;	
	wire    [249:0]     spike_out           ;
	wire				spike_out_rempty	;
	
	SNN_3x2 SNN_3x2_dut(
		.clk              	(clk				),
		.reset_n          	(reset_n			),
		.sys_clk          	(sys_clk			),
		.sys_reset_n      	(sys_reset_n		),
	
		.next_core			(next_core			),
		.parameter_in		(parameter_in		),
		.param_winc       	(param_winc			),
		.param_wfull		(param_wfull		),
	
		.neuron_inst_wdata	(neuron_inst_wdata	),
		.neuron_inst_winc 	(neuron_inst_winc	),
		.neuron_inst_wfull	(neuron_inst_wfull	),
	
		.packet_winc        (packet_winc        ),
        .packet_wdata       (packet_wdata       ),
		.packet_wfull		(packet_wfull		),

		.packet_out_rinc	(packet_out_rinc	),
		.packet_out_rempty	(packet_out_rempty	),
		.packet_out			(packet_out			),

		.spike_out_rinc		(spike_out_rinc		),
		.spike_out_rempty	(spike_out_rempty	),
		.spike_out			(spike_out			),

        .spike_en           (spike_en           ),
        .load_end           (load_end           ),
		.next_core_en		(next_core_en		),
		.tick_ready			(tick				),
		.complete         	(complete			),
		.spike_out			(spike_out			),
		.grid_state			(grid_state			)
	);

	//load param
	// reg [367:0] neuron_parameter   [0:4][0:255];
	reg [367:0] neuron_parameter0   [0:255];
	reg [367:0] neuron_parameter1   [0:255];
	reg [367:0] neuron_parameter2   [0:255];
	reg [367:0] neuron_parameter3   [0:255];
	reg [367:0] neuron_parameter4   [0:255];
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_param0.mem", neuron_parameter0);
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_param1.mem", neuron_parameter1);
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_param2.mem", neuron_parameter2);
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_param3.mem", neuron_parameter3);
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_param4.mem", neuron_parameter4);
	
	reg [1:0]   neuron_instructions [0:255];
	initial $readmemb("/home/riolet/rtl/OneDrive-2023-01-06/mem/neuron_inst.mem", neuron_instructions);

	// đọc số lượng packet trong mỗi tick
	reg [11:0] num_pic [0:NUM_PICTURE - 1];
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/num_inputs_4.mem", num_pic);
	//initial $readmemh("/coasiasemi/project/ds/users/dat.nguyen/Internship_Training/rtl/design/soc/ip/csv_sfifo/sim/tb_unit/ranc/tb_num_inputs.txt", num_pic);
	
	// đọc tất cả các packet
	reg [29:0] packet [0:NUM_PACKET - 1];
	initial $readmemh("/home/riolet/rtl/OneDrive-2023-01-06/mem/packet_input_4.mem", packet);
	//initial $readmemb("/coasiasemi/project/ds/users/dat.nguyen/Internship_Training/rtl/design/soc/ip/csv_sfifo/sim/tb_unit/ranc/tb_input.txt", packet);

	reg [NUM_OUTPUT - 1:0] output_soft [0:NUM_PICTURE - 1];
	initial $readmemb("/home/riolet/rtl/OneDrive-2023-01-06/mem/simulator_output.txt", output_soft);
	reg [NUM_OUTPUT - 1:0] output_file [0:NUM_PICTURE - 1];

	int begin_packet_addr;
	int i,j,m,n;
	int num_line;
	reg wrong;
	reg spike_ok;
	initial wrong = 0;

	initial begin
	    clk = 0;
	    forever #3.75 clk = ~clk;
	end

	initial begin
	    sys_clk = 0;
	    forever #3 sys_clk = ~sys_clk;
	end

	initial begin
	    sys_rst = 1;
	    csr_rst = 0; @(negedge clk); sys_rst = 0;
	    #50 csr_rst = 1;
	end

	always @(sys_rst, csr_rst) begin
	    reset_n = sys_rst | csr_rst;
		sys_reset_n = reset_n;
	end

	initial begin
		#120000000 $finish();
		wait(complete == 1) $display ("Complete SNN");
		$finish();
	end

	always @(spike_out_rempty) begin
		if(!spike_out_rempty) begin
			@(posedge sys_clk) 
			spike_out_rinc = 1'b1;
			@(posedge sys_clk)
			spike_out_rinc = 1'b0;
			output_file[num_line] = spike_out;
			@(negedge clk);
			num_line = num_line + 1;
		end
	end

	
	initial begin
		//$writememh("/coasiasemi/project/ds/users/dat.nguyen/Internship_Training/rtl/design/soc/ip/csv_sfifo/sim/tb_unit/ranc/neuron_inst_hex.mem", neuron_instructions);
		param_winc = 0;
    	neuron_inst_winc = 0;
		begin_packet_addr = 0;
		packet_winc = 0;
		spike_en = 0;
		load_end = 0;
		next_core	= 0;
		num_line	= 0;
		spike_ok	= 0;
		packet_out_rinc = 0;
		spike_out_rinc	= 0;
		#100;

		for (i = 0; i < 256; i++) begin
				@(negedge sys_clk);
				parameter_in = neuron_parameter0[i];
				param_winc = 1;
				@(negedge sys_clk);
				param_winc = 0;
		end
		wait(next_core_en == 1) $display ("Done loading param core 0");
		next_core = next_core + 1'b1;
		for (i = 0; i < 256; i++) begin
				@(negedge sys_clk);
				parameter_in = neuron_parameter1[i];
				param_winc = 1;
				@(negedge sys_clk);
				param_winc = 0;
		end
		wait(next_core_en == 1) $display ("Done loading param core 1");
		next_core = next_core + 1'b1;
		for (i = 0; i < 256; i++) begin
				@(negedge sys_clk);
				parameter_in = neuron_parameter2[i];
				param_winc = 1;
				@(negedge sys_clk);
				param_winc = 0;
		end
		wait(next_core_en == 1) $display ("Done loading param core 2");
		next_core = next_core + 1'b1;
		for (i = 0; i < 256; i++) begin
				@(negedge sys_clk);
				parameter_in = neuron_parameter3[i];
				param_winc = 1;
				@(negedge sys_clk);
				param_winc = 0;
		end
		wait(next_core_en == 1) $display ("Done loading param core 3");
		next_core = next_core + 1'b1;
		for (i = 0; i < 256; i++) begin

				@(negedge sys_clk);
				parameter_in = neuron_parameter4[i];
				param_winc = 1;
				@(negedge sys_clk);
				param_winc = 0;

		end
		wait(next_core_en == 1) $display ("Done loading param core 4");
		next_core = next_core + 1'b1;

		for (j = 0; j < 256; j++) begin
			@(negedge sys_clk);
			neuron_inst_wdata = neuron_instructions[j];
			neuron_inst_winc = 1;
			@(negedge sys_clk);
			neuron_inst_winc = 0;
		end
//		repeat(250) @(negedge clk);

		for (i = 0; i < NUM_PICTURE; i++) begin
			if (i > 1) begin
				spike_en = 1;
			end
			if (i > 2) begin
				spike_ok = 1;
			end
	    	@(posedge sys_clk);
	    	for (j = 0; j < num_pic[i]; j++) begin
	    		@(negedge sys_clk);
	        	packet_wdata = packet[begin_packet_addr + j];
	        	packet_winc = 1;
	        	@(negedge sys_clk);
	        	packet_winc = 0;
	    	end
	    	begin_packet_addr = begin_packet_addr + num_pic[i];
			wait(grid_state != 0);
			
			wait(grid_state == 0);
			while(~packet_out_rempty) begin 
	    		packet_out_rinc = 1;
				@(posedge sys_clk);
				packet_out_rinc = 0;
				@(posedge sys_clk);
	    	end
		end
		load_end = 1;
		wait(complete == 1) $display ("Complete SNN");
		while(~packet_out_rempty) begin 
	    		packet_out_rinc = 1;
				@(posedge sys_clk);
				packet_out_rinc = 0;
				@(posedge sys_clk);
	    	end
		repeat(10) @(posedge sys_clk);
		$writememb("/home/riolet/rtl/OneDrive-2023-01-06/mem/output.txt", output_file);
		for(m = 0; m < NUM_PICTURE; m = m + 1) begin
            for(n = 0; n < NUM_OUTPUT; n = n + 1) begin
                if(output_file[m][n] != output_soft[m][n]) begin
                    $display("Error at neuron %d, picture %d", n, m);
					wrong = 1;
                end
            end
        end
		#1; if(~wrong) $display("Test pass without error");
		$finish();
	end
	

endmodule
