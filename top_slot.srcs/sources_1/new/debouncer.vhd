library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mpg is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : out STD_LOGIC);
end mpg;

architecture Behavioral of mpg is
signal q1,q2,q3: std_logic:='0';
signal count:std_logic_vector(15 downto 0):=(others =>'0');
begin

count1: process(clk)
begin
if clk'event and clk='1' then
count<=count+1;
end if;
end process;

reg1: process(btn, clk)
begin
if clk'event and clk='1' then
if count=x"FFFF" then
q1<=btn;
end if;
end if;
end process;

reg2: process(clk)
begin
if clk'event and clk='1' then
q2<=q1;
q3<=q2;
end if;
end process;
enable<=q2 and not q3;
end Behavioral;