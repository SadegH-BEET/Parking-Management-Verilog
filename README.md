# Parking-Management-Verilog
![Alt Text](https://justpaste.it/img/dc31eb8a8d5ab5f42db9038b1310aa34.png)
In this project we are going to design a parking management system! this is final project of the Digital System Design course. in this design we get some inputs and after process them we give some outputs and we control our system.We have two types of capacity for our parking lot, one for university employees and students and the other for the public. These capacities change at different times of the day, and our design takes this into account.  
Our input and output signals are as follows:  
**inputs**
| Inputs | usage | 
| -------- | -------- | 
|car_exited   | tell us that a car has leaved    | 
| is_uni_car_entered   | shows that the car is for uni-capacity   | 
| car_entered   | tell us that a car has entred   | 
| is_uni_car_exited   | shows that the car is for uni-capacity   |   

**outputs**
| outputs | usage | 
| -------- | -------- | 
|is_vacated_space   | Is there free space available for free capacity?    | 
| uni_vacated_space   | The number of empty spaces belonging to the university   | 
| parked_care  | The number of cars parked in the parking lot related to free capacity d   | 
| uni_is_vacated_space   | Is there an empty space for the university?   | 
| vacated_space   | The number of empty spaces related to free capacity d   |
# tools  
In this project i used :  
* Vscode for writing verilog codes
* modelSim for simulating
* Quartus for synthesis
# Implementations Details
My project is made of two modules, one is TIMER module and the other is Parking module , I also designed another module to test my design called TESTBENCH  
In the TIMER module, I simulated time and used it in the Parking module as a factor influencing the parking capacity ,And in the Parking module, I implemented the existing rules. Also, the parking capacity change has been implemented according to the time.  
And in the Parking module, I implemented the existing rules. Also, the parking capacity change has been implemented according to the time.  
After implementing these modules, I synthesized my design using Quartus software, whose files are located in the synthesis folder.
# How to Run  
for synthesis step and using Quartus you can see this video  :   
[**Video**](https://drive.google.com/file/d/1JLdJ2Z_U5Z84exfwDvQMOEGFVdJlFThT/view?usp=sharing)   

![Cat GIF](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdncza2drbGhpeG4yOGR6YXNtMTljem01eGI2aGh0NncxaHo1YTBpcCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Iz5WbYNjmqyDympVJ1/giphy.gif)  

  

To use this program, you can use different software such as QEMU or ModelSim or iverilog in mac  
for running the Testbench with iverilog in mac you can use this command  
```
cd verilog
iverilog -o test TESTBENCH.v parking.v
vvp test
```
# Results  
after runnig the TESTBENCH.v file you can see the following results:  
![res1](https://github.com/SadegH-BEET/Parking-Management-Verilog/blob/main/1.png)   

and:  

![res2](https://github.com/SadegH-BEET/Parking-Management-Verilog/blob/main/2.png)

# Related Links  
[**Quartus**](https://www.intel.com/content/www/us/en/software-kit/666221/intel-quartus-ii-web-edition-design-software-version-13-1-for-windows.html)  
[**ModelSim**](https://www.intel.com/content/www/us/en/software-kit/750368/modelsim-intel-fpgas-standard-edition-software-version-18-1.html)   
[**VsCode**](https://code.visualstudio.com/download)  

# Author  
* **sadegh mohammadian** | **StudentNo : 401109477**




