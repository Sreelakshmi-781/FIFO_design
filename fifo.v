module syc_fifo(clk,rst,we,re,din,full,empty,dout);
    parameter width = 8,
              depth = 16,
              add_bus = 4;
    
    input clk,rst,we,re;
    input [width-1 : 0]din;
    output full,empty;
    output reg [width-1 : 0]dout;

    reg [width-1 : 0] fifo_mem [depth-1 : 0];
    reg [add_bus-1 : 0] rd_ptr, wr_ptr;
	 


    // memory logic
    always@(posedge clk) begin: b1
	    integer i;
        if(rst) begin
            dout <= 0;
            for (i=0; i<depth; i=i+1) fifo_mem[i] <= 0; // fifo initialize 0
        end
        else begin
            if(we && ~full) fifo_mem[wr_ptr] <= din; // write to fifo
            if(re && ~empty) dout <= fifo_mem[rd_ptr]; // read from fifo
        end
    end

    // address logic
    always@(posedge clk) begin
        if(rst) begin
            wr_ptr<=0;
            rd_ptr<=0;
        end
        else begin
            if(we && ~full) wr_ptr <= wr_ptr+1; 
            if(re && ~empty) rd_ptr <= rd_ptr+1;
        end
    end

    assign full  = ((wr_ptr == depth-1) && (rd_ptr == 0)) ? 1 : 0;
    assign empty = (wr_ptr == rd_ptr);


endmodule