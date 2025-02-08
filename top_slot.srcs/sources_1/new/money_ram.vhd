
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



entity moneyram is
port(clk: in std_logic;
        write:in std_logic;
        verify2:in std_logic;
        data: in std_logic_vector(15 downto 0);
        outp:out std_logic_vector(15 downto 0));
end moneyram;

architecture a of moneyram is
   type MEM is array(0 to 0) of std_logic_vector (15 downto 0);
signal RAM: MEM := (others=>x"00F5"); --85dec
begin
process(clk, write,data,verify2)
begin
--if clk'event and clk='1' then
if  write'event and write='0' then
if verify2='1' then
RAM(0)<=data;
end if;
end if;
--end if;
end process;
outp<=RAM(0);
end architecture;