----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/06/2024 02:15:10 PM
-- Design Name: 
-- Module Name: freq_div23 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_div23 is
    Port ( clk : in STD_LOGIC;
            q2:out std_logic;
            q3:out std_logic;
            q12:out std_logic
            );
end freq_div23;

architecture Behavioral of freq_div23 is
signal q_temp:std_logic_vector(3 downto 0):="0000";
signal div3_count:std_logic_vector(1 downto 0):="00";
signal tmp:std_logic:='0';
signal tmp2:std_logic:='0';
begin
process(clk)
begin
if clk'event and clk ='1' then
   
            if q_temp="1011" then
            q_temp<="0000";
            
            else
            q_temp<=q_temp+1;
            end if;
            if q_temp="0101" then
            tmp2<=not tmp2;
            end if;
                if div3_count = "10" then  -- When the counter for /3 clock reaches 2 (binary 10)
                        div3_count <= (others => '0');
                        tmp <= not tmp;
                    else
                        div3_count <= div3_count + 1;

                end if;
end if;
end process;
q2<=q_temp(0);
q3<=tmp;
q12<=tmp2;
end Behavioral;
