
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity segm7 is
    Port ( clk : in STD_LOGIC;
            display:out std_logic_vector(6 downto 0);
            --sel:in std_logic_vector(1 downto 0);
           number: in std_logic_vector(15 downto 0); --la asta dai valori in top module
            anod:out std_logic_vector(3 downto 0)
    );
end segm7;

architecture Behavioral of segm7 is

component decoder7 is
port (inn:in std_logic_vector(3 downto 0);
        outt: out std_logic_vector(6 downto 0));

end component;

signal show_numb : std_logic_vector(3 downto 0):="1111";



signal refresh_count: integer range 0 to 222222;
signal  digit_count: std_logic_vector(1 downto 0):="00";
begin

process(clk)
begin

if clk'event and clk='1' then
    refresh_count<=refresh_count+1;
    if refresh_count=222222 then
        refresh_count<=0;
        digit_count<=digit_count+'1';
        case digit_count is
        when "00" =>
        anod<="1110";
        show_numb<=number(3 downto 0);
        when "01"=>
        anod<="1101";
        show_numb<=number(7 downto 4);
        when "10" =>
        anod<="1011";
        show_numb<=number(11 downto 8);
        when "11"=>
        anod<="0111";
        show_numb<=number(15 downto 12);
        end case;
            
end if;
end if;
end process;
p1: decoder7 port map(show_numb, display);

end Behavioral;
