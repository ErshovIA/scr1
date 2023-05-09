module scr1_tb_log_cmd();

always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk)
begin
    if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01)
    begin
        // valid data from ahb router
        if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b1101111)
        begin
            // detect and command
            $display("\n\tDetect JAL command\n\tcurr_pc = %h\n\tmcause = %h\n\tmepc = %h\n\tmie = %h\n\tmip = %h\n\tmstatus = %h\n\tmtval = %h\n\tmtvec = %h\n",
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mcause,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mepc,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mie,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mip,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mstatus,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mtval,
            scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_tracelog.csr_trace1.mtvec);
        end
    end
end

endmodule
