module uart(
    clk,
    rst_n,
    rx_uart,
    led
);

input clk;
input rst_n;
input rx_uart;
output [7:0] led;

reg [7:0] led;
reg [12:0] cnt0;
wire add_cnt0;
wire end_cnt0;
reg flag;
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt0 <= 0;
    end
    else if(add_cnt0)begin
        if(end_cnt0)
            cnt0 <= 0;
        else
            cnt0 <= cnt0 + 1;
    end
end

assign add_cnt0 = flag==1;       
assign end_cnt0 = add_cnt0 && cnt0==5208-1 ;   

reg [3:0] cnt1;
wire add_cnt1;
wire end_cnt1;
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt1 <= 0;
    end
    else if(add_cnt1)begin
        if(end_cnt1)
            cnt1 <= 0;
        else
            cnt1 <= cnt1 + 1;
    end
end

assign add_cnt1 =end_cnt0 ;       
assign end_cnt1 = add_cnt1 && cnt1==10-1 ;

reg rx_uart_ff0;
reg rx_uart_ff1;
reg rx_uart_ff2;
always  @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)begin
        rx_uart_ff0<=1;
        rx_uart_ff1<=1;
        rx_uart_ff2<=1;

    end
    else begin
        rx_uart_ff0<=rx_uart;
        rx_uart_ff1<=rx_uart_ff0;
        rx_uart_ff2<=rx_uart_ff1;
    end
end

always  @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)begin
        flag <= 0;
    end
    else if(flag==0 && rx_uart_ff1==0 && rx_uart_ff2==1)begin
        flag<=1;
    end
    else if(end_cnt1)begin
        flag<=0;
    end
   
end
always  @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)begin
        led<=0;
    end
    else if( add_cnt0 && cnt0==5208/2-1 && cnt1== 1)begin
        led[0]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 2)begin
        led[1]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 3)begin
        led[2]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 4)begin
        led[3]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 5)begin
        led[4]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 6)begin
        led[5]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 7)begin
        led[6]<=rx_uart;
    end
    else if(add_cnt0 && cnt0==5208/2-1 && cnt1== 8)begin
        led[7]<=rx_uart;
    end
end
endmodule
