----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2024 11:42:44 AM
-- Design Name: 
-- Module Name: comp_top - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comp_top is
    Port ( a : in STD_LOGIC_vector(3 downto 0);--primu din stanga
            b:in std_logic_vector(3 downto 0); 
            c:in std_logic_vector(3 downto 0);
            verif1:out std_logic;--verif if first 2 are equal and 7
            verif2:out std_logic--verif if all 3 are equal
    );
end comp_top;

architecture Behavioral of comp_top is
component comparator4 is
    Port ( a : in STD_LOGIC_vector(3 downto 0);
            b:in std_logic_vector(3 downto 0);
            verif:out std_logic
    );
end component;
signal aux1,aux2,aux3:std_logic;
begin
p1:comparator4 port map(a,b,aux1);
p2: comparator4 port map(b,c,aux3);
p3: comparator4 port map(a,"0111",aux2);
verif1<=aux1 and aux2;
verif2<=aux1 and aux3;
end Behavioral;
