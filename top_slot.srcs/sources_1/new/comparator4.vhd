----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2024 11:39:02 AM
-- Design Name: 
-- Module Name: comparator4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator4 is
    Port ( a : in STD_LOGIC_vector(3 downto 0);
            b:in std_logic_vector(3 downto 0);
            verif:out std_logic
    );
end comparator4;

architecture Behavioral of comparator4 is

begin
process(a,b)
begin
if a=b and a/="1110" then
verif<='1';
else
verif<='0';
end if;
end process;
end Behavioral;
