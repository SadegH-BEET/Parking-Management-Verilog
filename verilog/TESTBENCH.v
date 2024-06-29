module TB_Parking ();
    reg clk;
    reg start;
    reg car_entered;
    reg is_uni_car_entered;
    reg car_exited;
    reg is_uni_car_exited;
    wire [15:0] uni_car_parked;
    wire [15:0] parked_car;
    wire [15:0] uni_vacated_space;
    wire [15:0] vacated_space;
    wire uni_is_vacated_space;
    wire is_vacated_space;
    wire [11:0] Time;

    Parking parking(clk,start,car_entered,is_uni_car_entered,car_exited,is_uni_car_exited,uni_car_parked,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space,Time);

    initial begin
        clk <= 0;
        start <= 0;
        car_entered <= 0;
        car_exited <= 0;
        is_uni_car_entered <= 0;
        is_uni_car_exited <= 0;
    end

    always begin
        #5 clk <= ~clk;
    end

    initial begin
        #12;
        start = 1;
        #20;
        car_exited <= 1;
        is_uni_car_exited = 0;
        #1;
        car_exited = 0;
        #80;
        car_entered <= 1;
        is_uni_car_entered = 0;
        #1;
        car_entered = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 1;
        #1;
        car_entered = 0;
        #20;
        car_exited <= 1;
        is_uni_car_exited = 0;
        #1;
        car_exited = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 1;
        #1;
        car_entered = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 1;
        #1;
        car_entered = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 0;
        #1;
        car_entered = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 0;
        #1;
        car_entered = 0;
        #20;
        car_exited <= 1;
        is_uni_car_exited = 0;
        #1;
        car_exited = 0;
        #20;
        car_entered <= 1;
        is_uni_car_entered = 0;
        #1;
        car_entered = 0;
        #20;
        car_exited <= 1;
        is_uni_car_exited = 1;
        #1;
        car_exited = 0;
        #300;
        $stop();
    end

    initial begin
        $monitor("time:  %d car entered: %d car exited: %d uni car parked: %d parked car : %d uni vacated space: %d vacated space:   %d", Time , car_entered, car_exited, $signed(uni_car_parked),$signed(parked_car),$signed(uni_vacated_space), $signed(vacated_space));
    end
endmodule
