--am transformat din 4 cifre in 3 cifre peste tot

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_slot is
    Port ( play_btn : in STD_LOGIC;
        clk:in std_logic;
        bet:in std_logic_vector(1 downto 0);
        sel:in std_logic;
        --verif1,verif2: out std_logic;--verif1 cel mai in dreapta pe led uri, vericia  77
        seg:out std_logic_vector(6 downto 0);
         an:out std_logic_vector(3 downto 0);
        outp: out std_logic_vector(4 downto 0)
                    );
end top_slot;

architecture Behavioral of top_slot is


component numb_gen is
    Port ( enable : in STD_LOGIC;
            clk:in std_logic;
            q:out std_logic_vector(3 downto 0)
    
    );
end component;
component timing_module is
    Port ( play_btn : in STD_LOGIC;
   
    clk:in std_logic;
        f1,f2,f3:out std_logic;
        
       en1,en2,en3:out std_logic
    );
end component;
component segm7 is
    Port ( clk : in STD_LOGIC;
            display:out std_logic_vector(6 downto 0);
            --sel:in std_logic_vector(1 downto 0);
           number: in std_logic_vector(15 downto 0); --la asta dai valori in top module
            anod:out std_logic_vector(3 downto 0)
    );
end component;
component mux is
    Port ( a : in STD_LOGIC_vector(15 downto 0);
            b:in std_logic_vector(15 downto 0);
            enable:in std_logic;
            sel:in std_logic;
            outp:out std_logic_vector(15 downto 0)
    );
end component;
component moneyram is
port(clk: in std_logic;
        write:in std_logic;
                verify2:in std_logic;

        data: in std_logic_vector(15 downto 0);
        outp:out std_logic_vector(15 downto 0));
end component;
component comp_top is
    Port ( a : in STD_LOGIC_vector(3 downto 0);--primu din stanga
            b:in std_logic_vector(3 downto 0); 
            c:in std_logic_vector(3 downto 0);
            verif1:out std_logic;--verif if first 2 are equal and 7
            verif2:out std_logic--verif if all 3 are equal
    );
end component;
component binary_bcd is
    generic(N: positive := 16);
    port(
        clk, reset: in std_logic;
        binary_in: in std_logic_vector(N-1 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
    );
end component ;
component wincalc is
    Port ( --a: in std_logic_vector(3 downto 0);--first digit left to right
            bet:in std_logic_vector (2 downto 0);
            verif:in std_logic_vector (1 downto 0);
            money:in std_logic_vector(15 downto 0);--from money ram
            outp:out std_logic_vector(15 downto 0)
    );
end component;
component errver is
    Port ( a : in STD_LOGIC_vector(15 downto 0);
            b:in std_logic_vector(1 downto 0);
            outt:out std_logic
    );
end component;
component mux2 is
    Port ( a : in STD_LOGIC_vector (15 downto 0);
            b:in std_logic_vector (15 downto 0);
            sell:in std_logic;
            outp:out std_logic_vector(15 downto 0)
    
    );
end component;

component win_block is
    Port ( a : in STD_LOGIC_vector(1 downto 0);--verification
    num:in std_logic_vector(3 downto 0);
            enable:in std_logic;
            clk:in std_logic;
            outp: out std_logic_vector(4 downto 0)
    );
end component;

signal f1,f2,f3: std_logic; --delayed clocks
signal en1,en2,en3:std_logic;--enables for number generators
signal q_out1,q_out2,q_out3: std_logic_vector(3 downto 0); --outputs of number gens
signal number_to_show: std_logic_vector(15 downto 0);--number on 7seg from the rngs
signal not_play:std_logic;--not play btn required for moneyram
signal money_inputt,moneyout:std_logic_vector(15 downto 0):=x"0050";--money to be changed in the rom of the money
signal mux_out:std_logic_vector(15 downto 0); --for the 7segm
signal verif:std_logic_vector(1 downto 0);
signal bcdmoney: std_logic_vector(15 downto 0);
signal auxx: std_logic_vector(3 downto 0);
signal bet2:std_logic_vector(2 downto 0);
signal moneywl: std_logic_vector(15 downto 0);--money from wincalc component, after doing the computations
signal verify:std_logic;--for errver compinent, output
signal finalnum, badnr:std_logic_vector(15 downto 0);--numbers for second mux
begin
not_play<=not play_btn;
bet2<='0' & bet;
p1: timing_module port map(play_btn, clk,f1,f2,f3,en1,en2,en3);

p2: numb_gen port map(en1, f1,q_out1); --cel mai din stanga
p3:numb_gen port map(en2, f2,q_out2);
p4:numb_gen port map(en3, f3,q_out3); --cel mai din dreapta

--outp (11 downto 8)<=q_out3;
--outp(7 downto 4)<=q_out2;
--outp(3 downto 0)<=q_out1;
number_to_show(15 downto 12)<="1111";
number_to_show (11 downto 8)<=q_out1;
number_to_show(7 downto 4)<=q_out2;
number_to_show(3 downto 0)<=q_out3;
badnr<=x"feee";
p5: segm7 port map (clk,seg, mux_out,an);

p6:moneyram port map(clk,play_btn,verify,moneywl,moneyout);--facut and intre play btn si de la verif

p7:mux port map(finalnum,bcdmoney,play_btn,sel,mux_out); --finalnum from mux2, prev number to show

p8:comp_top port map(q_out1,q_out2,q_out3,verif(1),verif(0));
--verif1<=verif(1);
--verif2<=verif(0);
p9: binary_bcd port map(clk, '0',moneyout,bcdmoney(3 downto 0), bcdmoney(7 downto 4), bcdmoney(11 downto 8), bcdmoney(15 downto 12),auxx);

p10:wincalc port map(bet2,verif,moneyout,moneywl);

p11:errver port map(moneyout,bet,verify);
p12:mux2 port map(badnr,number_to_show,verify,finalnum);

p13:win_block port map(verif,q_out1,not_play,f3,outp);

end Behavioral;
