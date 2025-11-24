module fifo_tb();
    parameter width=8,
              depth=16;

    reg clk,rst,re,we;
    reg [width-1 : 0] din;
    wire full,empty;
    wire [width-1 : 0] dout;

    syc_fifo dut(.clk(clk),.rst(rst),.we(we),.re(re),.din(din),.full(full),.empty(empty),.dout(dout));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task reset;
        begin
            @(negedge clk);
            rst = 1;
            @(negedge clk);
            rst = 0;
        end 
    endtask

    task fifo_write;
        input [width-1 : 0] t_din;
        input t_we, t_re;
        begin
            we=t_we;
            re=t_re; 
            din=t_din;
        end
    endtask

    task fifo_read;
        input t_we, t_re;
        begin
            we=t_we;
            re=t_re; 
        end
    endtask

    initial begin
        reset;
        repeat(16) begin
            fifo_write({$random}, 1,0);
            @(negedge clk);
        end

        repeat (16) begin
            fifo_read(0,1);
            @(negedge clk);
        end

        fork
            fifo_write({$random}, 0,0);
            fifo_read(0,0);
        join
        #200 $finish;
    end
endmodule