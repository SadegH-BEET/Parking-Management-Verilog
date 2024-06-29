module TIMER (input start,clk,
              output reg [11:0] Time);
        reg [12:0] count;
        always @(posedge clk) 
        begin
        if (~start) 
        begin
            Time <= 0;
            count <= 0;
        end
        else 
        begin
            if (count >= 60) 
            begin
                Time <= Time + 1;
                count <= 0;
            end

            if (Time >= 24) 
            begin
                Time <= 0;
            end

            else 

            begin
                count <= count + 30;
            end
        end
    end
    
endmodule

