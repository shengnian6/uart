module tb_uart;

parameter   CYCLE = 20 ;
reg         clk    ;
reg         rst_n  ;
reg         rx_uart;
wire  [7:0] led    ;


uart uut(
     .clk     (clk    ) ,
     .rst_n   (rst_n  ) ,
     .rx_uart (rx_uart) ,
     .led     (led    )    
);

initial begin
    clk = 0 ;
    forever#(CYCLE/2)begin
        clk = ~clk;
    end
end

initial begin
    #1;
    rst_n = 0;
    #(10*CYCLE);
    rst_n = 1;
end

initial begin
    #1;
    rx_uart = 1;
    #(100*CYCLE);
    rx_uart = 0 ;
    #104000;
    rx_uart = 1;
    #104000;
    rx_uart = 0;
    #(3*104000);
    rx_uart = 1;
    #(2*104000);
    rx_uart = 0;
    #(2*104000);
    rx_uart = 1;


    #(2*104000);
    rx_uart = 0 ;
    #104000;
    rx_uart = 1;
    #104000;
    rx_uart = 1;
    #(3*104000);
    rx_uart = 1;
    #(2*104000);
    rx_uart = 1;
    #(2*104000);
    rx_uart = 1;
end









endmodule
