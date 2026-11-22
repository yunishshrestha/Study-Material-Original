library ieee;
use ieee.std_logic_1164.all;

entity de is
    port (
        A, B, C : in bit;
        d0, d1, d2, d3, d4, d5, d6, d7 : out bit
    );
end de;

architecture behave of de is
begin
    d0 <= (not A) and (not B) and (not C);
    d1 <= (not A) and (not B) and C;
    d2 <= (not A) and B and (not C);
    d3 <= (not A) and B and C;
    d4 <= A and (not B) and (not C);
    d5 <= A and (not B) and C;
    d6 <= A and B and (not C);
    d7 <= A and B and C;
end behave;
