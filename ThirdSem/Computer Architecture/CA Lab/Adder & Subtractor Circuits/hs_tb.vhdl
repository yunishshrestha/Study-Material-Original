library ieee;
use ieee.std_logic_1164.all;

entity hs_tb is
end hs_tb;

architecture test of hs_tb is
    component hs
        port (
            a  : in bit;
            b  : in bit;
            d  : out bit;
            bo : out bit
        );
    end component;

    signal a, b, d, bo : bit;

begin
    half_subtractor : hs
        port map (
            a  => a,
            b  => b,
            d  => d,
            bo => bo
        );

    process
    begin
        a <= '0'; b <= '0'; wait for 1 ns;
        a <= '0'; b <= '1'; wait for 1 ns;
        a <= '1'; b <= '0'; wait for 1 ns;
        a <= '1'; b <= '1'; wait for 1 ns;

        assert false report "End of Half Subtractor Test";
        wait;
    end process;
end test;
