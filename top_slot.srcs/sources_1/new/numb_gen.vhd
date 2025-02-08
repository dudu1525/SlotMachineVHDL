

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

entity numb_gen is
    Port ( enable : in STD_LOGIC;
            clk:in std_logic;
            q:out std_logic_vector(3 downto 0)
    
    );
end numb_gen;

architecture Behavioral of numb_gen is
signal q_temp:std_logic_vector(3 downto 0):="0000";
begin
process(clk,enable)
begin
if clk'event and clk ='1' then
    if enable='1' then
            if q_temp="0111" then
            q_temp<="0001";
            else
            q_temp<=q_temp+1;
            end if;

end if;
end if;
end process;
q<=q_temp;
end Behavioral;
