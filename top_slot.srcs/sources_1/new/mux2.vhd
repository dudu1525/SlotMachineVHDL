----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2024 10:57:50 AM
-- Design Name: 
-- Module Name: mux2 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2 is
    Port ( a : in STD_LOGIC_vector (15 downto 0);
            b:in std_logic_vector (15 downto 0);
            sell:in std_logic;
            outp:out std_logic_vector(15 downto 0)
    
    );
end mux2;

architecture Behavioral of mux2 is

begin
process(a,b,sell)
begin
if sell='0' then
outp<=a; --cel cu FEEE
else
outp<=b;
end if;
end process;

end Behavioral;
