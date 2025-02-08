----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2024 08:35:30 AM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port ( a : in STD_LOGIC_vector(15 downto 0);
            b:in std_logic_vector(15 downto 0);
            enable:in std_logic;
            sel:in std_logic;
            outp:out std_logic_vector(15 downto 0)
    );
end mux;

architecture Behavioral of mux is
begin
process(sel, a,b,enable)
begin

if sel='1' and enable='0' then
outp<=b;
else
outp<=a;
end if;
end process;



end Behavioral;
