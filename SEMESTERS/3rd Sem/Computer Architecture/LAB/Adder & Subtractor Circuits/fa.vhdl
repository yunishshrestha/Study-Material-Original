library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a   : in bit;
        b   : in bit;
        cin : in bit;
        s   : out bit;
        c   : out bit
    );
end fa;

architecture behave of fa is
begin
    s <= a xor b xor cin;
    c <= (a and b) or (b and cin) or (a and cin);
end behave;
