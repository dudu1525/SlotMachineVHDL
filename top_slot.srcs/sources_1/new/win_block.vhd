----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2024 10:20:27 AM
-- Design Name: 
-- Module Name: win_block - Behavioral
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

entity win_block is
    Port ( a : in STD_LOGIC_vector(1 downto 0);--verification
    num: in std_logic_vector (3 downto 0);
            enable:in std_logic;
            clk:in std_logic;
            outp: out std_logic_vector(4 downto 0)
    );
end win_block;

architecture Behavioral of win_block is
signal count:std_logic_vector(4 downto 0):="00000";
begin
process(a,enable,clk,num)
begin
if enable='0' or num="0000" then
count<="00000";
    elsif (enable='1' and a="10") or (enable='1' and a="11") or (enable='1' and a="01") then
    if clk'event and clk='1' then
    if count="00000" then
    count<="00001";
    elsif count="00001" then
    count<="00010"; 
    elsif count="00010" then
    count<="00100";
    elsif count="00100" then
    count<="01000";
    elsif count="01000" then
    count<="10000";
    elsif count="10000" then
    count<="00001";
    end if;

end if;
end if;
end process;
outp<=count;
end Behavioral;
