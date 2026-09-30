
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:09 09/30/2026
-- Design Name:   Universal_Shift
-- Module Name:   Universal_Shift_tb.vhd
-- Project Name:  Universal_Shift_Register
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Universal_Shift
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY Universal_Shift_tb_vhd IS
END Universal_Shift_tb_vhd;

ARCHITECTURE behavior OF Universal_Shift_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Universal_Shift
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		S1 : IN std_logic;
		S0 : IN std_logic;
		Serial_in : IN std_logic;
		Parallel_in : IN std_logic_vector(3 downto 0);          
		Q : OUT std_logic_vector(3 downto 0);
		Serial_out : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL reset :  std_logic := '0';
	SIGNAL S1 :  std_logic := '0';
	SIGNAL S0 :  std_logic := '0';
	SIGNAL Serial_in :  std_logic := '0';
	SIGNAL Parallel_in :  std_logic_vector(3 downto 0) := (others=>'0');

	--Outputs
	SIGNAL Q :  std_logic_vector(3 downto 0);
	SIGNAL Serial_out :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Universal_Shift PORT MAP(
		clk => clk,
		reset => reset,
		S1 => S1,
		S0 => S0,
		Serial_in => Serial_in,
		Parallel_in => Parallel_in,
		Q => Q,
		Serial_out => Serial_out
	);
	
 clk <= not clk after 50 ns;
	tb : PROCESS
	BEGIN

		--Reset 
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
		
		--PIPO : Parallel Load
		S1 <= '1';
		S0 <= '1';
		parallel_in <= "1010";
		wait for 100 ns;
		--Hold 
		S1 <= '0';
		S0 <= '0';
		wait for 100 ns;
		--Right shift
		S1 <= '0';
		S0 <= '1';
		Serial_in <= '1';
		Wait for 100 ns;
		Serial_in <= '0';
		Wait for 100 ns;
		Serial_in <= '1';
		Wait for 100 ns;
		
      --Left Shift 
		S1 <= '1';
		S0 <= '0';
		Serial_in <= '0';
		Wait for 100 ns;
		Serial_in <= '1';
		Wait for 100 ns;
		Serial_in <= '0';
		Wait for 100 ns;
		

		wait; -- will wait forever
	END PROCESS;

END;
