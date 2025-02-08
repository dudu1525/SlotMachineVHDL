library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wincalc is
    Port ( --a: in std_logic_vector(3 downto 0);--first digit left to right
            bet:in std_logic_vector (2 downto 0);
            verif:in std_logic_vector (1 downto 0);
            money:in std_logic_vector(15 downto 0);--from money ram
            outp:out std_logic_vector(15 downto 0)
    );
end wincalc;

architecture Behavioral of wincalc is
signal aux:std_logic_vector(2 downto 0);
begin
aux<= bet+'1';
    process(bet,verif,money,aux)
    begin
    case verif is
    when "00"=>outp <=std_logic_vector(unsigned(money)-(5*unsigned(aux)));
    when "01"=>
    case aux is
    when "001"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+190);
    when "010"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+380);
    when "011"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+570);
when others=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+760);
    end case;
    when "10" =>
    case aux is
     when "001"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+50);
       when "010"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+100);
       when "011"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+150);
   when others=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+200);
    end case;
    when "11" =>
    case aux is
    when "001"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+310);
           when "010"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+620);
           when "011"=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+930);
       when others=>outp<=std_logic_vector(unsigned(money)-(5*unsigned(aux))+1240);
    end case;
    when others =>outp<=money;
    end case;
end process;
end Behavioral;