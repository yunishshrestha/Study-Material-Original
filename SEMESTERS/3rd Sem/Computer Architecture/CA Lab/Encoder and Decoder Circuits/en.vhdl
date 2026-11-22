library ieee;
use ieee.std_logic_1164.all;

entity en is
    port (
        e0, e1, e2, e3, e4, e5, e6, e7 : in bit;
        A, B, C : out bit
    );
end en;

architecture behave of en is
begin
    A <= e4 or e5 or e6 or e7;
    B <= e2 or e3 or e6 or e7;
    C <= e1 or e3 or e5 or e7;
end behave;
