library ieee;
use ieee.std_logic_1164.all;

entity fs_tb is
end fs_tb;

architecture test of fs_tb is
    component fs
        port (
            a    : in bit;
            b    : in bit;
            bin  : in bit;
            d    : out bit;
            bout : out bit
        );
    end component;

    signal a, b, bin, d, bout : bit;

begin
    full_subtractor : fs
        port map (
            a    => a,
            b    => b,
            bin  => bin,
            d    => d,
            bout => bout
        );

    process
    begin
        a <= '0'; b <= '0'; bin <= '0'; wait for 1 ns;
        a <= '0'; b <= '0'; bin <= '1'; wait for 1 ns;
        a <= '0'; b <= '1'; bin <= '0'; wait for 1 ns;
        a <= '0'; b <= '1'; bin <= '1'; wait for 1 ns;
        a <= '1'; b <= '0'; bin <= '0'; wait for 1 ns;
        a <= '1'; b <= '0'; bin <= '1'; wait for 1 ns;
        a <= '1'; b <= '1'; bin <= '0'; wait for 1 ns;
        a <= '1'; b <= '1'; bin <= '1'; wait for 1 ns;

        assert false report "End of Full Subtractor Test";
        wait;
    end process;
end test;
