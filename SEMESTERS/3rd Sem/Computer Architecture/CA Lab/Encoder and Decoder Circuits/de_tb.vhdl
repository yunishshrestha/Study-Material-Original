library ieee;
use ieee.std_logic_1164.all;

entity de_tb is
end de_tb;

architecture test of de_tb is
    component de
        port (
            A, B, C : in bit;
            d0, d1, d2, d3, d4, d5, d6, d7 : out bit
        );
    end component;

    signal A, B, C : bit;
    signal d0, d1, d2, d3, d4, d5, d6, d7 : bit;

begin
    decoder_unit : de
        port map (
            A => A, B => B, C => C,
            d0 => d0, d1 => d1, d2 => d2, d3 => d3,
            d4 => d4, d5 => d5, d6 => d6, d7 => d7
        );

    process
    begin
        A <= '0'; B <= '0'; C <= '0'; wait for 1 ns;
        A <= '0'; B <= '0'; C <= '1'; wait for 1 ns;
        A <= '0'; B <= '1'; C <= '0'; wait for 1 ns;
        A <= '0'; B <= '1'; C <= '1'; wait for 1 ns;
        A <= '1'; B <= '0'; C <= '0'; wait for 1 ns;
        A <= '1'; B <= '0'; C <= '1'; wait for 1 ns;
        A <= '1'; B <= '1'; C <= '0'; wait for 1 ns;
        A <= '1'; B <= '1'; C <= '1'; wait for 1 ns;

        assert false report "Reached end of Test.";
        wait;
    end process;
end test;
