library ieee;
use ieee.std_logic_1164.all;

entity fs is
    port (
        a    : in bit;
        b    : in bit;
        bin  : in bit;
        d    : out bit;
        bout : out bit
    );
end fs;

architecture behave of fs is
begin
    d    <= a xor b xor bin;
    bout <= (not a and b) or (not a and bin) or (b and bin);
end behave;
