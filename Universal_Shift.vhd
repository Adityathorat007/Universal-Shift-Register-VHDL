----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:13 09/30/2026 
-- Design Name: 
-- Module Name:    Universal_Shift - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Universal_Shift is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           Serial_in : in  STD_LOGIC;
           Parallel_in : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           Serial_out : out  STD_LOGIC);
end Universal_Shift;

architecture Behavioral of Universal_Shift is

signal reg : STD_LOGIC_VECTOR ( 3 downto 0);
begin

process (clk, reset)
begin 
if reset = '1' then 
reg <= "0000";
elsif rising_edge(clk) then 

--Hold
if S1 = '0' and S0 = '0' then  
reg <= reg;

--Right Shift
elsif S1 = '0' and S0 = '1' then
reg <= Serial_in & reg( 3 downto 1);

--left shift 
elsif S1 = '1' and S0 = '0' then
reg <= reg( 2 downto 0) & Serial_in;

--Parallel in 
elsif S1 = '1' and S0 = '1' then
reg <= parallel_in;

else 
reg <= reg;

end if;
end if;
end process;
Q <= reg;
Serial_out <= reg(0);

end Behavioral;

