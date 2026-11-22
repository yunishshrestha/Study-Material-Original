library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end fa_tb;

architecture test of fa_tb is
    component fa
        port (
            a   : in bit;
            b   : in bit;
            cin : in bit;
            s   : out bit;
            c   : out bit
        );
    end component;

    signal a, b, cin, s, c : bit;

begin
    full_adder : fa
        port map (
            a   => a,
            b   => b,
            cin => cin,
            s   => s,
            c   => c
        );

    process
    begin
        a <= '0'; b <= '0'; cin <= '0';
        wait for 1 ns;

        a <= '0'; b <= '0'; cin <= '1';
        wait for 1 ns;

        a <= '0'; b <= '1'; cin <= '0';
        wait for 1 ns;

        a <= '0'; b <= '1'; cin <= '1';
        wait for 1 ns;

        a <= '1'; b <= '0'; cin <= '0';
        wait for 1 ns;

        a <= '1'; b <= '0'; cin <= '1';
        wait for 1 ns;

        a <= '1'; b <= '1'; cin <= '0';
        wait for 1 ns;

        a <= '1'; b <= '1'; cin <= '1';
        wait for 1 ns;

        assert false report "Reached End of Test.";
        wait;
    end process;
end test;
