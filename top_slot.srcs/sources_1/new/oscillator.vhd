--bassically a clock divider to achieve a 45hz clock

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity oscillator is
    Port ( clkin : in STD_LOGIC;
            clkout:out std_logic
    );
end oscillator;

architecture Behavioral of oscillator is
signal count:integer range 0 to 888888:=0;
begin
process(clkin)
begin
if clkin'event and clkin='1' then
if count=888888 then
clkout<='1';
count<=0;
else
count<=count+1;
clkout<='0';
end if;
end if;
end process;

end Behavioral;
