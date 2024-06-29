
module Parking(input start,input clk,input car_entered,input is_uni_car_entered,input car_exited,input is_uni_car_exited,
               output reg [15:0] uni_car_parked,output reg [15:0] parked_car,output reg [15:0] uni_vacated_space,output reg [15:0] vacated_space,output reg uni_is_vacated_space,output reg is_vacated_space,output wire [11:0] Time);
    
    integer MAX_CAP_PARKING = 700;

    TIMER timer (clk,start,Time);

    
    integer universityCapacity;
    integer outCapacity;

        always @(car_entered or car_exited or start or Time) 
        begin

        if (~start) 
        begin
            uni_car_parked <= 0;
            parked_car <= 0;
            uni_vacated_space <= universityCapacity;
            vacated_space <= outCapacity;
            uni_is_vacated_space <= 1'b1;
            is_vacated_space <= 1'b1;
        end
        else if (start) 
        begin 
            vacated_space = outCapacity - parked_car;
            uni_vacated_space = universityCapacity - uni_car_parked;

            if (car_entered) 
            begin                                  
                if (parked_car + uni_car_parked < MAX_CAP_PARKING) 
                begin     
                    if (is_uni_car_entered) 
                    begin                      
                        if ( 1 <= uni_is_vacated_space && $signed(uni_vacated_space)) 
                        begin                
                            uni_car_parked = uni_car_parked + 1;
                            uni_vacated_space = universityCapacity - uni_car_parked;

                            if (uni_car_parked >= universityCapacity) 
                            begin   
                                uni_is_vacated_space = 1'b0;
                            end
                        end
                    end
                    else 
                    begin
                        if (is_vacated_space && $signed(vacated_space) >= 1) 
                        begin                     
                            parked_car = parked_car + 1;
                            vacated_space = outCapacity - parked_car;
                            if (parked_car >= outCapacity) 
                            begin
                                is_vacated_space = 1'b0;
                            end
                        end
                    end
                end
            end
            else if (car_exited) 
            begin                             
                if (is_uni_car_exited) 
                begin                       
                    if (uni_car_parked > 0) 
                    begin    
                        uni_car_parked = uni_car_parked - 1;
                        uni_vacated_space <= universityCapacity - uni_car_parked;
                        if (!uni_is_vacated_space) 
                        begin                
                            uni_is_vacated_space = 1'b1;
                        end
                    end
                end
                else 
                begin                                          
                    if (parked_car > 0) 
                    begin
                        parked_car = parked_car - 1;
                        vacated_space <= outCapacity - parked_car;
                        if (!is_vacated_space) 
                        begin
                            is_vacated_space = 1'b1;
                        end
                    end
                end
            end
        end
        
        //TIME AND CAPACITY
        if (Time < 8) 
        begin
            universityCapacity = 0;
            outCapacity = 0;
        end
        else if (Time < 13) 
        begin
            universityCapacity = 500;
            outCapacity = 200;
        end
        else if (Time < 14) 
        begin
            universityCapacity = 450;
            outCapacity = 250;
        end
        else if (Time < 15) 
        begin
            universityCapacity = 400;
            outCapacity = 300;
        end
        else if (Time < 16) 
        begin
            universityCapacity = 350;
            outCapacity = 350;
        end
        else 
        begin
            universityCapacity = 200;
            outCapacity = 500;
        end

    end


endmodule   
