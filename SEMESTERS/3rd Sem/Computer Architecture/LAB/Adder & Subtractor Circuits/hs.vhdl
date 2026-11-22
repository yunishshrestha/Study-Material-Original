library ieee;
use ieee.std_logic_1164.all;

entity hs is
    port (
        a  : in bit;
        b  : in bit;
        d  : out bit;
        bo : out bit
    );
end hs;

architecture behave of hs is
begin
    d  <= a xor b;
    bo <= (not a) and b;
end behave;
