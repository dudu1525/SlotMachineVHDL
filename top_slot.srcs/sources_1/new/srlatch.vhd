library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BISTABIL_D is
    Port ( D : in STD_LOGIC;
       R : in STD_LOGIC;
       CLK : in STD_LOGIC;
       Q : out STD_LOGIC
       );
end BISTABIL_D;

architecture Behavioral of BISTABIL_D is
    signal q_aux: STD_LOGIC:='0';
begin
process(D, R, CLK)
begin
    if R='0' then
        q_aux<='0';
    elsif CLK'EVENT AND CLK='1' then
        q_aux<=D;
    end if;
end process;
Q <= q_aux;

end Behavioral;