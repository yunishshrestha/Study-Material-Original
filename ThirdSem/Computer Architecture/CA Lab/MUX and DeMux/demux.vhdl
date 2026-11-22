library ieee;
use ieee.std_logic_1164.all;

entity demux is
    port(
        d : in bit;
        s0,s1,s2 : in bit;
        y0,y1,y2,y3,y4,y5,y6,y7 : out bit
    );
end demux;

architecture demux_unit of demux is
begin
    y0 <= d and not s2 and not s1 and not s0;
    y1 <= d and not s2 and not s1 and s0;
    y2 <= d and not s2 and s1 and not s0;
    y3 <= d and not s2 and s1 and s0;
    y4 <= d and s2 and not s1 and not s0;
    y5 <= d and s2 and not s1 and s0;
    y6 <= d and s2 and s1 and not s0;
    y7 <= d and s2 and s1 and s0;
end demux_unit;
