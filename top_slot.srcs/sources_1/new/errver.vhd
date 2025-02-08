----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2024 10:41:08 AM
-- Design Name: 
-- Module Name: errver - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity errver is
    Port ( a : in STD_LOGIC_vector(15 downto 0);
            b:in std_logic_vector(1 downto 0);
            outt:out std_logic
    );
end errver;

architecture Behavioral of errver is
signal aux:std_logic_vector(15 downto 0);
begin
process(a,b,aux)
begin
case b is
when "00"=>aux<=x"0005";
when "01"=>aux<=x"000a";
when "10"=>aux<=x"000f";
when others=>aux<=x"0014";
end case;
if a<aux then
outt<='0';
else
outt<='1';
end if;
end process;
end Behavioral;
