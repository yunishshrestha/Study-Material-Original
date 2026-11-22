library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture test of mux_tb is
component mux
port(
    i0,i1,i2,i3,i4,i5,i6,i7 : in bit;
    s0,s1,s2 : in bit;
    y : out bit
);
end component;

signal i0,i1,i2,i3,i4,i5,i6,i7 : bit;
signal s0,s1,s2,y : bit;

begin
mux_unit : mux port map(
    i0=>i0, i1=>i1, i2=>i2, i3=>i3,
    i4=>i4, i5=>i5, i6=>i6, i7=>i7,
    s0=>s0, s1=>s1, s2=>s2, y=>y
);

process
begin
    s2<='0'; s1<='0'; s0<='0';
    i0<='1'; i1<='0'; i2<='0'; i3<='0';
    i4<='0'; i5<='0'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='0'; s1<='0'; s0<='1';
    i0<='0'; i1<='1'; i2<='0'; i3<='0';
    i4<='0'; i5<='0'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='0'; s1<='1'; s0<='0';
    i0<='0'; i1<='0'; i2<='1'; i3<='0';
    i4<='0'; i5<='0'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='0'; s1<='1'; s0<='1';
    i0<='0'; i1<='0'; i2<='0'; i3<='1';
    i4<='0'; i5<='0'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='1'; s1<='0'; s0<='0';
    i0<='0'; i1<='0'; i2<='0'; i3<='0';
    i4<='1'; i5<='0'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='1'; s1<='0'; s0<='1';
    i0<='0'; i1<='0'; i2<='0'; i3<='0';
    i4<='0'; i5<='1'; i6<='0'; i7<='0';
    wait for 1 ns;

    s2<='1'; s1<='1'; s0<='0';
    i0<='0'; i1<='0'; i2<='0'; i3<='0';
    i4<='0'; i5<='0'; i6<='1'; i7<='0';
    wait for 1 ns;

    s2<='1'; s1<='1'; s0<='1';
    i0<='0'; i1<='0'; i2<='0'; i3<='0';
    i4<='0'; i5<='0'; i6<='0'; i7<='1';
    wait for 1 ns;

    assert false report "Reached end of test";
    wait;
end process;

end test;
