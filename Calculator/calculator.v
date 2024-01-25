`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:24:02 PM
// Design Name: 
// Module Name: calculator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calculator(
                    input signA, 
                    input signB,
                    input [3:0] A,
                    input [3:0] B,
                    input [1:0] sel,
                    output [3:0] signQ, // for BCD that's why 4 bits
                    output [3:0] Q
                    );
reg tempSignQ;
reg [3:0] tempSignQOut;
reg [3:0] tempQ;      
        
integer i;  
            
always@(signA or signB or A or B or sel)
begin
    tempQ <= 4'b0000;
    
    if(sel == 1'b00) // Addition Mode
    begin
        if(signA == 1 && signB == 0) // A is neg, B is pos
        begin
            if(A > B)
            begin
                tempQ <= A - B;
                tempSignQ <= 1;
            end
            else if (A < B)
            begin
                tempQ <= B - A;
                tempSignQ <= 0;
            end
            else if(A == B)
            begin
                tempQ <= 4'b0000;
                tempSignQ <= 0;
            end
        end
        
        if(signA == 0 && signB == 1) //A is pos, B is neg
        begin
            if(A > B)
            begin
                tempQ <= A - B;
                tempSignQ <= 0;
            end
            else if(A < B)
            begin
                tempQ <= B - A;
                tempSignQ <= 1;
            end
            else if(A == B)
            begin
                tempQ <= 4'b0000;
                tempSignQ <= 0;
            end
        end
        
        if(signA == 0 && signB == 0) // Both positive
        begin
            tempQ <= A + B;
            tempSignQ <= 0;
        end
        
        if(signA == 1 && signB == 1) // Both Negative
        begin
            tempQ <= A + B;
            tempSignQ <= 1;
        end
    end
    
    if(sel == 1'b01) // Subtraction Mode
    begin
        if(signA == 1 && signB == 0) // A is neg, B is pos
        begin
            tempQ <= A + B;
            tempSignQ <= 1;
        end
        
        if(signA == 0 && signB == 1) // A is pos, B is neg
        begin
            tempQ <= A + B;
            tempSignQ <= 0;
        end
        
        if(signA == 0 && signB == 0) // Both Positive
        begin
            if(A > B)
            begin
                tempQ <= A - B;
                tempSignQ <= 0;
            end
            
            else if(A < B)
            begin
                tempQ <= B - A;
                tempSignQ <= 1;
            end
            
            else if (A == B)
            begin
                tempQ <= 4'b0000;
                tempSignQ <= 0;
            end
        end
            
        if(signA == 1 && signB == 1) // Both Negative
        begin
            if(A > B)
            begin
                tempQ <= A - B;
                tempSignQ <= 1;
            end
            
            else if(A < B)
            begin
                tempQ <= B - A;
                tempSignQ <= 0;
            end
            
            else if(A == B)
            begin
                tempQ <= 4'b0000;
                tempSignQ <= 0;
            end
        end   
    end
   
    if(sel == 2'b10) // Multiplication Mode
    begin
        for(i = 0; i < B; i = i + 1)
        begin
            tempQ <= tempQ + A;
        end
        
        if(signA == signB) tempSignQ <= 0; // They match so sign is positive
        else if(signA != signB) tempSignQ <= 1; // Don't match which means it's a neg
    end 
    
    if(sel == 2'b11) // Division Mode (not implemented)
    begin
        tempQ <= 0;
        tempSignQ <= 0;
    end
    
    if(tempQ >= 10) // Adjust for BCD
        tempQ <= tempQ + 4'b0110;
        
    if(tempSignQ == 1) tempSignQOut <= 4'b1111;
    if(tempSignQ == 0) tempSignQOut <= 4'b1110;
end

assign Q = tempQ;
assign signQ = tempSignQOut;                    
     
endmodule














                   /* input [4:0] A, //bit 4 for sign
                    input [4:0] B,
                    input [2:0] operation,
                    output [3:0] out,   
                    output sign_fin     
                    );
reg [3:0] tempA;
reg [3:0] tempB;
reg [4:0] tempOut;
                 
always@(A || B || operation)
begin
tempOut = 5'b00000;

    //Adjusts for sign
    if(A[4] == 1)
        tempA = ~A[3:0] + 1;
    else
        tempA = A[3:0];
    if(B[4] == 1)
       tempB = ~B[3:0] + 1;
    else
        tempB = B[3:0];
       
    //Chooses operation    
    if(operation == 2'b00)//addition
        tempOut = tempA + tempB;
    else if(operation == 2'b01)
        tempOut = tempA - tempB;
    else if(operation == 2'b11)
        tempOut = tempA * tempB;
        
    //Adjusts for BCD Validity
    if(tempOut[3:0] >= 10)
        tempOut[3:0] <= tempOut[3:0] + 4'b0110; 
        
end

assign out = tempOut[3:0];   
assign sign_fin = tempOut[4];    
endmodule
*/