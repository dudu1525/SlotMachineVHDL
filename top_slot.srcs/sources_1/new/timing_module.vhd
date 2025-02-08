

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timing_module is
    Port ( play_btn : in STD_LOGIC;
   
    clk:in std_logic;
        f1,f2,f3:out std_logic;
        
       en1,en2,en3:out std_logic
    );
end timing_module;

architecture Behavioral of timing_module is
component oscillator is
    Port ( clkin : in STD_LOGIC;
            clkout:out std_logic
    );
end component;
component freq_div23 is
    Port ( clk : in STD_LOGIC;
            q2:out std_logic;
            q3:out std_logic;
            q12:out std_logic
            );
end component;

component BISTABIL_D is
    Port ( D : in STD_LOGIC;
       R : in STD_LOGIC;
       CLK : in STD_LOGIC;
       Q : out STD_LOGIC
       );
end component;





--signal play_btn:std_logic;--debounced button
--QA IS LSB
signal outp1: std_logic;
signal outp21,outp22: std_logic;

 signal clk1:std_logic; --45hz clock
 signal f12:std_logic;--clk1 mod12
 signal f22,f33:std_logic;
begin

p1: oscillator port map (clk,clk1);
p2:freq_div23 port map(clk1, f22,f33,f12);
f1<=clk1;

en1<=play_btn;
en2<=play_btn;
en3<=play_btn;
--p4: BISTABIL_D port map(play_btn,'1',f12,en1); --delayed first digit

--p5: BISTABIL_D port map(play_btn,'1',f22,outp1); --delayed second digit
--p6: BISTABIL_D port map(outp1,'1',f22,en2);

--p7: BISTABIL_D port map(play_btn,'1',f33,outp21); --delayed third digit
--p8: BISTABIL_D port map(outp21,'1',f33,outp22);
--p9: BISTABIL_D port map(outp22,'1',f33,en3);
f2<=f22;
f3<=f33;
end Behavioral;
