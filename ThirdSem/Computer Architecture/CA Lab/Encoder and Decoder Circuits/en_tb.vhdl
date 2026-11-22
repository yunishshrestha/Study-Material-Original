library ieee;
use ieee.std_logic_1164.all;

entity en_tb is
end en_tb;

architecture test of en_tb is
    component en
        port (
            e0, e1, e2, e3, e4, e5, e6, e7 : in bit;
            A, B, C : out bit
        );
    end component;

    signal e0, e1, e2, e3, e4, e5, e6, e7 : bit;
    signal A, B, C : bit;

begin
    encoder_unit : en
        port map (
            e0 => e0, e1 => e1, e2 => e2, e3 => e3,
            e4 => e4, e5 => e5, e6 => e6, e7 => e7,
            A => A, B => B, C => C
        );

    process
    begin
        e0 <= '1'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '1'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '1'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '1'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '1'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '1'; e6 <= '0'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '1'; e7 <= '0'; wait for 1 ns;
        e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '1'; wait for 1 ns;

        assert false report "Reached End of Test.";
        wait;
    end process;
end test;
