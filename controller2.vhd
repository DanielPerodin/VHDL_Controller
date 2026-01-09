library ieee;
use ieee.std_logic_1164.all;

entity controller2 is port(
	--inputs:
	Q1, Q0, IR2, IR1, IR0: in std_logic;
	
	--outputs:
	MSA1, MSA0: out std_logic;
	MSB1, MSB0: out std_logic;
	MSC2, MSC1, MSC0: out std_logic;
	IR_LD: out std_logic;
	D1, D0: out std_logic;
	PC_LD: out std_logic;
	PC_INC: out std_logic
		
);

end controller2;

architecture behavior of controller2 is

	begin
	
	PC_INC<=((    Q1) or (    Q0));
			  
	PC_LD <=((    Q1) and (    Q0));
	
	IR_LD<= ((not Q1) and (not Q0));
	
	D1   <= ((not IR2) and (not IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((not IR2) and (    IR1) and (    IR0) and (not Q1) and (    Q0));
	
	D0   <= ((not Q1) and (not Q0)) or
			  ((not IR2) and (not IR1) and (not IR0) and (not Q1) and (    Q0));
	
	MSC2 <= ((not IR2) and (    IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (    IR0) and (not Q1) and (    Q0));
	
	MSC1 <= ((    IR2) and (not IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (    IR0) and (not Q1) and (    Q0));
	
	MSC0 <= ((not IR2) and (    IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (    IR0) and (not Q1) and (    Q0));
			  
	MSB1 <= ((    IR2) or (    IR1) or (not IR0) or (    Q1) or (not Q0));
			  
	MSB0 <= ((not IR2) and (not IR1) and (    IR0) and (not Q1) and (    Q0));
	
	MSA1 <= ((not IR2) and (    IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (not IR0) and (not Q1) and (    Q0)) or
			  ((    IR2) and (not IR1) and (    IR0) and (not Q1) and (    Q0));
			  
	MSA0 <= ((not Q1) or (   Q0));
			  
			  end behavior;