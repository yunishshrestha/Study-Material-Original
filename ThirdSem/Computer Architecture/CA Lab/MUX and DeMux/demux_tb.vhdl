library ieee;
use ieee.std_logic_1164.all;

entity demux_tb is
end demux_tb;

architecture test of demux_tb is
    component demux
        port(
            d : in bit;
            s0,s1,s2 : in bit;
            y0,y1,y2,y3,y4,y5,y6,y7 : out bit
        );
    end component;

    signal d : bit;
    signal s0,s1,s2 : bit;
    signal y0,y1,y2,y3,y4,y5,y6,y7 : bit;

begin
    demux_unit : demux port map(
        d => d,
        s0 => s0, s1 => s1, s2 => s2,
        y0 => y0, y1 => y1, y2 => y2, y3 => y3,
        y4 => y4, y5 => y5, y6 => y6, y7 => y7
    );

    process
    begin
        d <= '1';

        s2 <= '0'; s1 <= '0'; s0 <= '0'; wait for 1 ns;
        s2 <= '0'; s1 <= '0'; s0 <= '1'; wait for 1 ns;
        s2 <= '0'; s1 <= '1'; s0 <= '0'; wait for 1 ns;
        s2 <= '0'; s1 <= '1'; s0 <= '1'; wait for 1 ns;
        s2 <= '1'; s1 <= '0'; s0 <= '0'; wait for 1 ns;
        s2 <= '1'; s1 <= '0'; s0 <= '1'; wait for 1 ns;
        s2 <= '1'; s1 <= '1'; s0 <= '0'; wait for 1 ns;
        s2 <= '1'; s1 <= '1'; s0 <= '1'; wait for 1 ns;

        assert false report "Reached end of test";
        wait;
    end process;

end test;
