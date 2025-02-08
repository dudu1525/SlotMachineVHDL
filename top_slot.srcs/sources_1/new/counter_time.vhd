library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LS93 is
    Port (
        A     : in  STD_LOGIC;    -- Clock input for the divide-by-2 section
        B     : in  STD_LOGIC;    -- Clock input for the divide-by-8 section
        R0_1  : in  STD_LOGIC;    -- Reset input 1
        R0_2  : in  STD_LOGIC;    -- Reset input 2
        QA    : out STD_LOGIC;    -- Output of the divide-by-2 section
        QB    : out STD_LOGIC;    -- Output of the divide-by-8 section
        QC    : out STD_LOGIC;    -- Output of the divide-by-8 section
        QD    : out STD_LOGIC     -- Output of the divide-by-8 section
    );
end LS93;

architecture Behavioral of LS93 is
    signal count2 : STD_LOGIC_VECTOR(0 downto 0) := (others => '0'); -- 1-bit counter for divide-by-2
    signal count8 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- 3-bit counter for divide-by-8
begin

    -- Process for divide-by-2 section
    process(A, R0_1, R0_2)
    begin
        if R0_1 = '0' or R0_2 = '0' then
            count2 <= "0";
        elsif falling_edge(A) then
            count2 <= count2 + 1;
        end if;
    end process;

    -- Output for divide-by-2 section
    QA <= count2(0);

    -- Process for divide-by-8 section
    process(B, R0_1, R0_2)
    begin
        if R0_1 = '0' or R0_2 = '0' then
            count8 <= (others => '0');
        elsif falling_edge(B) then
            count8 <= count8 + 1;
        end if;
    end process;

    -- Outputs for divide-by-8 section
    QB <= count8(0);
    QC <= count8(1);
    QD <= count8(2);

end Behavioral;
