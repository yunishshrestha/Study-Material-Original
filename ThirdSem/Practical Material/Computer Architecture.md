## **Basic Gates.**



**and/or/nor/xor/xnor (replace 'and' by respective gate)**

**Architecture:**

library ieee; 

use ieee.std\_logic\_1164.all; 

entity andl is 

port 

( a, b: in bit; 

&#x20; o: out bit 

); 

end andl; 

architecture behave of andl is 

begin 

o<= a and b; 

end behave;



**Test Bench**

library ieee;

use ieee.std\_logic\_1164.all;

entity andl\_tb is

end andl\_tb;

architecture test of andl\_tb is

component andl

port

(

&#x09;a: in bit;

&#x09;b: in bit;

&#x09;o: out bit

);

end component;

signal a,b,o: bit;

begin

and\_gate:andl port map (a=>a, b=>b, o=>o);

process begin

a <= '0';

b <= '0' ;

wait for 1 ns;

a <= '0';

b <= '1';

wait for 1 ns;

a <= '1';

b <= '0';

wait for 1 ns;

a <= '1';

b <= '1';

wait for 1 ns;

assert false report "Reached end of test";

wait;

end process;

end test;



## **NOT GATE**

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;

entity notl is

port

(

&#x20; a : in bit;

&#x20; o : out bit

);

end notl;



architecture behave of notl is

begin

o <= not a;

end behave;





**Test Bench**

library ieee;

use ieee.std\_logic\_1164.all;

entity notl\_tb is

end notl\_tb;



architecture test of notl\_tb is

&#x20;   component notl

&#x20;       port (

&#x20;           a : in bit;

&#x20;           o : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal a, o : bit;



begin



&#x20;   not\_gate : notl

&#x20;       port map ( a => a, o => o );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; 	

&#x20;       wait for 1 ns;



&#x20;       a <= '1';

&#x20;       wait for 1 ns;



&#x20;       assert false report "Reached end of test";

&#x20;       wait;

&#x20;   end process;



end test;





## PARALLEL ADDER

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity pa is

port (

&#x20;   A, B : in std\_logic\_vector (3 downto 0);

&#x20;   S : out std\_logic\_vector (3 downto 0);

&#x20;   cin : in std\_logic;

&#x20;   cout : out std\_logic

);

end pa;



architecture behave of pa is

begin

&#x20;   process(A, B, cin)

&#x20;   variable t : std\_logic;

&#x20;   begin

&#x20;       t := cin;

&#x20;       for i in 0 to 3 loop

&#x20;           S(i) <= A(i) xor B(i) xor t;

&#x20;           t := (A(i) and B(i)) or ((t and A(i)) or (t and B(i)));

&#x20;       end loop;

&#x20;       cout <= t;

&#x20;   end process;

end behave;



**Test Bench**

library ieee;

use ieee.std\_logic\_1164.all;



entity pa\_tb is

end pa\_tb;



architecture test of pa\_tb is

&#x20;   component pa

&#x20;   port (

&#x20;       A, B : in std\_logic\_vector (3 downto 0);

&#x20;       S : out std\_logic\_vector (3 downto 0);

&#x20;       cin : in std\_logic;

&#x20;       cout : out std\_logic

&#x20;   );

&#x20;   end component;



&#x20;

&#x20;   signal A, B : std\_logic\_vector(3 downto 0) := (others => '0');

&#x20;   signal Cin : std\_logic := '0';

&#x20;   signal S : std\_logic\_vector(3 downto 0) := (others => '0');

&#x20;   signal Cout : std\_logic := '0';



begin

&#x20;   parallel\_adder : pa port map (

&#x20;       A => A, B => B, S => S, Cin => Cin, Cout => Cout

&#x20;   );



&#x20;   process begin

&#x20;

&#x20;

&#x20;       A <= "0101";

&#x20;       B <= "0100";

&#x20;       Cin <= '0';

&#x20;       wait for 20 ns;

&#x20;

&#x20;       A <= "1101";

&#x20;       B <= "0011";

&#x20;       Cin <= '1';

&#x20;       wait for 20 ns;

&#x20;

&#x20;       A <= "1100";

&#x20;       B <= "1001";

&#x20;       Cin <= '1';

&#x20;       wait for 20 ns;

&#x20;

&#x20;       A <= "1010";

&#x20;       B <= "1001";

&#x20;       Cin <= '1';

&#x20;       wait for 20 ns;

&#x20;

&#x20;       wait;

&#x20;   end process;

end test;





## PARALLEL SUBTRACTOR

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity ps is

port (

&#x20;   A, B  : in  std\_logic\_vector(3 downto 0);

&#x20;   D     : out std\_logic\_vector(3 downto 0);

&#x20;   bin   : in  std\_logic;

&#x20;   bout  : out std\_logic

);

end ps;



architecture behave of ps is

begin

&#x20;   process(A, B, bin)

&#x20;       variable t : std\_logic;

&#x20;   begin

&#x20;       t := bin;

&#x20;       for i in 0 to 3 loop

&#x20;           D(i) <= A(i) xor B(i) xor t;

&#x20;           t := ((not A(i)) and B(i)) or

&#x20;                (t and (not (A(i) xor B(i))));

&#x20;       end loop;

&#x20;       bout <= t;

&#x20;   end process;

end behave;



**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity ps\_tb is

end ps\_tb;



architecture test of ps\_tb is

&#x20;   component ps

&#x20;   port (

&#x20;       A, B  : in  std\_logic\_vector(3 downto 0);

&#x20;       D     : out std\_logic\_vector(3 downto 0);

&#x20;       bin   : in  std\_logic;

&#x20;       bout  : out std\_logic

&#x20;   );

&#x20;   end component;



&#x20;   signal A, B : std\_logic\_vector(3 downto 0) := (others => '0');

&#x20;   signal Bin  : std\_logic := '0';

&#x20;   signal D    : std\_logic\_vector(3 downto 0);

&#x20;   signal Bout : std\_logic;



begin

&#x20;   parallel\_subtractor : ps

&#x20;   port map (

&#x20;       A => A, B => B, D => D, Bin => Bin, Bout => Bout

&#x20;   );



&#x20;   process

&#x20;   begin

&#x20;       A <= "0101"; 

&#x09;	B <= "0011"; Bin <= '0';

&#x20;       wait for 20 ns;



&#x20;       A <= "0101"; 

&#x09;	B <= "0110"; Bin <= '0';

&#x20;       wait for 20 ns;



&#x20;       A <= "1000"; 

&#x09;	B <= "0011"; Bin <= '1';

&#x20;       wait for 20 ns;



&#x20;       A <= "0010"; 

&#x09;	B <= "0101"; Bin <= '1';

&#x20;       wait for 20 ns;



&#x20;       wait;

&#x20;   end process;

end test;



## MUX

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity mux is

port(

&#x20;   i0,i1,i2,i3,i4,i5,i6,i7 : in bit;

&#x20;   s0,s1,s2 : in bit;

&#x20;   y : out bit

);

end mux;



architecture behave of mux is

begin

y <= (not s2 and not s1 and not s0 and i0) or

&#x20;    (not s2 and not s1 and s0 and i1) or

&#x20;    (not s2 and s1 and not s0 and i2) or

&#x20;    (not s2 and s1 and s0 and i3) or

&#x20;    (s2 and not s1 and not s0 and i4) or

&#x20;    (s2 and not s1 and s0 and i5) or

&#x20;    (s2 and s1 and not s0 and i6) or

&#x20;    (s2 and s1 and s0 and i7);

end behave;



**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity mux\_tb is

end mux\_tb;



architecture test of mux\_tb is

component mux

port(

&#x20;   i0,i1,i2,i3,i4,i5,i6,i7 : in bit;

&#x20;   s0,s1,s2 : in bit;

&#x20;   y : out bit

);

end component;



signal i0,i1,i2,i3,i4,i5,i6,i7 : bit;

signal s0,s1,s2,y : bit;



begin

mux\_unit : mux port map(

&#x20;   i0=>i0, i1=>i1, i2=>i2, i3=>i3,

&#x20;   i4=>i4, i5=>i5, i6=>i6, i7=>i7,

&#x20;   s0=>s0, s1=>s1, s2=>s2, y=>y

);



process

begin

&#x20;   s2<='0'; s1<='0'; s0<='0';

&#x20;   i0<='1'; i1<='0'; i2<='0'; i3<='0';

&#x20;   i4<='0'; i5<='0'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='0'; s1<='0'; s0<='1';

&#x20;   i0<='0'; i1<='1'; i2<='0'; i3<='0';

&#x20;   i4<='0'; i5<='0'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='0'; s1<='1'; s0<='0';

&#x20;   i0<='0'; i1<='0'; i2<='1'; i3<='0';

&#x20;   i4<='0'; i5<='0'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='0'; s1<='1'; s0<='1';

&#x20;   i0<='0'; i1<='0'; i2<='0'; i3<='1';

&#x20;   i4<='0'; i5<='0'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='1'; s1<='0'; s0<='0';

&#x20;   i0<='0'; i1<='0'; i2<='0'; i3<='0';

&#x20;   i4<='1'; i5<='0'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='1'; s1<='0'; s0<='1';

&#x20;   i0<='0'; i1<='0'; i2<='0'; i3<='0';

&#x20;   i4<='0'; i5<='1'; i6<='0'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='1'; s1<='1'; s0<='0';

&#x20;   i0<='0'; i1<='0'; i2<='0'; i3<='0';

&#x20;   i4<='0'; i5<='0'; i6<='1'; i7<='0';

&#x20;   wait for 1 ns;



&#x20;   s2<='1'; s1<='1'; s0<='1';

&#x20;   i0<='0'; i1<='0'; i2<='0'; i3<='0';

&#x20;   i4<='0'; i5<='0'; i6<='0'; i7<='1';

&#x20;   wait for 1 ns;



&#x20;   assert false report "Reached end of test";

&#x20;   wait;

end process;



end test;



## DEMUX

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity demux is

&#x20;   port(

&#x20;       d : in bit;

&#x20;       s0,s1,s2 : in bit;

&#x20;       y0,y1,y2,y3,y4,y5,y6,y7 : out bit

&#x20;   );

end demux;



architecture demux\_unit of demux is

begin

&#x20;   y0 <= d and not s2 and not s1 and not s0;

&#x20;   y1 <= d and not s2 and not s1 and s0;

&#x20;   y2 <= d and not s2 and s1 and not s0;

&#x20;   y3 <= d and not s2 and s1 and s0;

&#x20;   y4 <= d and s2 and not s1 and not s0;

&#x20;   y5 <= d and s2 and not s1 and s0;

&#x20;   y6 <= d and s2 and s1 and not s0;

&#x20;   y7 <= d and s2 and s1 and s0;

end demux\_unit;





**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity demux\_tb is

end demux\_tb;



architecture test of demux\_tb is

&#x20;   component demux

&#x20;       port(

&#x20;           d : in bit;

&#x20;           s0,s1,s2 : in bit;

&#x20;           y0,y1,y2,y3,y4,y5,y6,y7 : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal d : bit;

&#x20;   signal s0,s1,s2 : bit;

&#x20;   signal y0,y1,y2,y3,y4,y5,y6,y7 : bit;



begin

&#x20;   demux\_unit : demux port map(

&#x20;       d => d,

&#x20;       s0 => s0, s1 => s1, s2 => s2,

&#x20;       y0 => y0, y1 => y1, y2 => y2, y3 => y3,

&#x20;       y4 => y4, y5 => y5, y6 => y6, y7 => y7

&#x20;   );



&#x20;   process

&#x20;   begin

&#x20;       d <= '1';



&#x20;       s2 <= '0'; s1 <= '0'; s0 <= '0'; wait for 1 ns;

&#x20;       s2 <= '0'; s1 <= '0'; s0 <= '1'; wait for 1 ns;

&#x20;       s2 <= '0'; s1 <= '1'; s0 <= '0'; wait for 1 ns;

&#x20;       s2 <= '0'; s1 <= '1'; s0 <= '1'; wait for 1 ns;

&#x20;       s2 <= '1'; s1 <= '0'; s0 <= '0'; wait for 1 ns;

&#x20;       s2 <= '1'; s1 <= '0'; s0 <= '1'; wait for 1 ns;

&#x20;       s2 <= '1'; s1 <= '1'; s0 <= '0'; wait for 1 ns;

&#x20;       s2 <= '1'; s1 <= '1'; s0 <= '1'; wait for 1 ns;



&#x20;       assert false report "Reached end of test";

&#x20;       wait;

&#x20;   end process;



end test;





## ENCODER

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity en is

&#x20;   port (

&#x20;       e0, e1, e2, e3, e4, e5, e6, e7 : in bit;

&#x20;       A, B, C : out bit

&#x20;   );

end en;



architecture behave of en is

begin

&#x20;   A <= e4 or e5 or e6 or e7;

&#x20;   B <= e2 or e3 or e6 or e7;

&#x20;   C <= e1 or e3 or e5 or e7;

end behave;





**TESTBENCH**

library ieee;

use ieee.std\_logic\_1164.all;



entity en\_tb is

end en\_tb;



architecture test of en\_tb is

&#x20;   component en

&#x20;       port (

&#x20;           e0, e1, e2, e3, e4, e5, e6, e7 : in bit;

&#x20;           A, B, C : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal e0, e1, e2, e3, e4, e5, e6, e7 : bit;

&#x20;   signal A, B, C : bit;



begin

&#x20;   encoder\_unit : en

&#x20;       port map (

&#x20;           e0 => e0, e1 => e1, e2 => e2, e3 => e3,

&#x20;           e4 => e4, e5 => e5, e6 => e6, e7 => e7,

&#x20;           A => A, B => B, C => C

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       e0 <= '1'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '1'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '1'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '1'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '1'; e5 <= '0'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '1'; e6 <= '0'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '1'; e7 <= '0'; wait for 1 ns;

&#x20;       e0 <= '0'; e1 <= '0'; e2 <= '0'; e3 <= '0'; e4 <= '0'; e5 <= '0'; e6 <= '0'; e7 <= '1'; wait for 1 ns;



&#x20;       assert false report "Reached End of Test.";

&#x20;       wait;

&#x20;   end process;

end test;





## DECODER

**Architecture**



library ieee;

use ieee.std\_logic\_1164.all;



entity de is

&#x20;   port (

&#x20;       A, B, C : in bit;

&#x20;       d0, d1, d2, d3, d4, d5, d6, d7 : out bit

&#x20;   );

end de;



architecture behave of de is

begin

&#x20;   d0 <= (not A) and (not B) and (not C);

&#x20;   d1 <= (not A) and (not B) and C;

&#x20;   d2 <= (not A) and B and (not C);

&#x20;   d3 <= (not A) and B and C;

&#x20;   d4 <= A and (not B) and (not C);

&#x20;   d5 <= A and (not B) and C;

&#x20;   d6 <= A and B and (not C);

&#x20;   d7 <= A and B and C;

end behave;





**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity de\_tb is

end de\_tb;



architecture test of de\_tb is

&#x20;   component de

&#x20;       port (

&#x20;           A, B, C : in bit;

&#x20;           d0, d1, d2, d3, d4, d5, d6, d7 : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal A, B, C : bit;

&#x20;   signal d0, d1, d2, d3, d4, d5, d6, d7 : bit;



begin

&#x20;   decoder\_unit : de

&#x20;       port map (

&#x20;           A => A, B => B, C => C,

&#x20;           d0 => d0, d1 => d1, d2 => d2, d3 => d3,

&#x20;           d4 => d4, d5 => d5, d6 => d6, d7 => d7

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       A <= '0'; B <= '0'; C <= '0'; wait for 1 ns;

&#x20;       A <= '0'; B <= '0'; C <= '1'; wait for 1 ns;

&#x20;       A <= '0'; B <= '1'; C <= '0'; wait for 1 ns;

&#x20;       A <= '0'; B <= '1'; C <= '1'; wait for 1 ns;

&#x20;       A <= '1'; B <= '0'; C <= '0'; wait for 1 ns;

&#x20;       A <= '1'; B <= '0'; C <= '1'; wait for 1 ns;

&#x20;       A <= '1'; B <= '1'; C <= '0'; wait for 1 ns;

&#x20;       A <= '1'; B <= '1'; C <= '1'; wait for 1 ns;



&#x20;       assert false report "Reached end of Test.";

&#x20;       wait;

&#x20;   end process;

end test;



## FULL ADDER

**Architecture**



library ieee;

use ieee.std\_logic\_1164.all;



entity fa is

&#x20;   port (

&#x20;       a   : in bit;

&#x20;       b   : in bit;

&#x20;       cin : in bit;

&#x20;       s   : out bit;

&#x20;       c   : out bit

&#x20;   );

end fa;



architecture behave of fa is

begin

&#x20;   s <= a xor b xor cin;

&#x20;   c <= (a and b) or (b and cin) or (a and cin);

end behave;





**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity fa\_tb is

end fa\_tb;



architecture test of fa\_tb is

&#x20;   component fa

&#x20;       port (

&#x20;           a   : in bit;

&#x20;           b   : in bit;

&#x20;           cin : in bit;

&#x20;           s   : out bit;

&#x20;           c   : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal a, b, cin, s, c : bit;



begin

&#x20;   full\_adder : fa

&#x20;       port map (

&#x20;           a   => a,

&#x20;           b   => b,

&#x20;           cin => cin,

&#x20;           s   => s,

&#x20;           c   => c

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; b <= '0'; cin <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '0'; b <= '0'; cin <= '1';

&#x20;       wait for 1 ns;



&#x20;       a <= '0'; b <= '1'; cin <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '0'; b <= '1'; cin <= '1';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '0'; cin <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '0'; cin <= '1';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '1'; cin <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '1'; cin <= '1';

&#x20;       wait for 1 ns;



&#x20;       assert false report "Reached End of Test.";

&#x20;       wait;

&#x20;   end process;

end test;



## FULL SUBTRACTOR

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity fs is

&#x20;   port (

&#x20;       a    : in bit;

&#x20;       b    : in bit;

&#x20;       bin  : in bit;

&#x20;       d    : out bit;

&#x20;       bout : out bit

&#x20;   );

end fs;



architecture behave of fs is

begin

&#x20;   d    <= a xor b xor bin;

&#x20;   bout <= (not a and b) or (not a and bin) or (b and bin);

end behave;

**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity fs\_tb is

end fs\_tb;



architecture test of fs\_tb is

&#x20;   component fs

&#x20;       port (

&#x20;           a    : in bit;

&#x20;           b    : in bit;

&#x20;           bin  : in bit;

&#x20;           d    : out bit;

&#x20;           bout : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal a, b, bin, d, bout : bit;



begin

&#x20;   full\_subtractor : fs

&#x20;       port map (

&#x20;           a    => a,

&#x20;           b    => b,

&#x20;           bin  => bin,

&#x20;           d    => d,

&#x20;           bout => bout

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; b <= '0'; bin <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '0'; bin <= '1'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; bin <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; bin <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; bin <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; bin <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; bin <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; bin <= '1'; wait for 1 ns;



&#x20;       assert false report "End of Full Subtractor Test";

&#x20;       wait;

&#x20;   end process;

end test;



## HALF ADDER

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity ha is

&#x20;   port (

&#x20;       a, b : in bit;

&#x20;       s, c : out bit

&#x20;   );

end ha;



architecture behave of ha is

begin

&#x20;   s <= a xor b;

&#x20;   c <= a and b;

end behave;



**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity ha\_tb is

end ha\_tb;



architecture test of ha\_tb is

&#x20;   component ha

&#x20;       port (

&#x20;           a : in bit;

&#x20;           b : in bit;

&#x20;           s : out bit;

&#x20;           c : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal a, b, s, c : bit;



begin

&#x20;   half\_adder : ha

&#x20;       port map (

&#x20;           a => a,

&#x20;           b => b,

&#x20;           s => s,

&#x20;           c => c

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; b <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '0'; b <= '1';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '0';

&#x20;       wait for 1 ns;



&#x20;       a <= '1'; b <= '1';

&#x20;       wait for 1 ns;



&#x20;       assert false report "Reached end of test";

&#x20;       wait;

&#x20;   end process;

end test;



## HALF SUBTRACTOR

**Architecture**



library ieee;

use ieee.std\_logic\_1164.all;



entity hs is

&#x20;   port (

&#x20;       a  : in bit;

&#x20;       b  : in bit;

&#x20;       d  : out bit;

&#x20;       bo : out bit

&#x20;   );

end hs;



architecture behave of hs is

begin

&#x20;   d  <= a xor b;

&#x20;   bo <= (not a) and b;

end behave;



**TestBench**

library ieee;

use ieee.std\_logic\_1164.all;



entity hs\_tb is

end hs\_tb;



architecture test of hs\_tb is

&#x20;   component hs

&#x20;       port (

&#x20;           a  : in bit;

&#x20;           b  : in bit;

&#x20;           d  : out bit;

&#x20;           bo : out bit

&#x20;       );

&#x20;   end component;



&#x20;   signal a, b, d, bo : bit;



begin

&#x20;   half\_subtractor : hs

&#x20;       port map (

&#x20;           a  => a,

&#x20;           b  => b,

&#x20;           d  => d,

&#x20;           bo => bo

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; b <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; wait for 1 ns;



&#x20;       assert false report "End of Half Subtractor Test";

&#x20;       wait;

&#x20;   end process;

end test;











## PARITY CHECKER

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity pc is

&#x20;   port (

&#x20;       a, b, c, d : in  std\_logic;

&#x20;       pe, po     : out std\_logic

&#x20;   );

end pc;



architecture behave of pc is

begin

&#x20;   pe <= (a xor b) xor (c xor d);

&#x20;   po <= not ((a xor b) xor (c xor d));

end behave;



**TESTBENCH**

library ieee;

use ieee.std\_logic\_1164.all;



entity pc\_tb is

end pc\_tb;



architecture test of pc\_tb is



&#x20;   component pc

&#x20;       port (

&#x20;           a, b, c, d : in  std\_logic;

&#x20;           pe, po     : out std\_logic

&#x20;       );

&#x20;   end component;



&#x20;   signal a, b, c, d : std\_logic := '0';

&#x20;   signal pe, po     : std\_logic;



begin



&#x20;   parity\_checker: pc

&#x20;       port map (

&#x20;           a  => a,

&#x20;           b  => b,

&#x20;           c  => c,

&#x20;           d  => d,

&#x20;           pe => pe,

&#x20;           po => po

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       a <= '0'; b <= '0'; c <= '0'; d <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '0'; c <= '0'; d <= '1'; wait for 1 ns;

&#x20;       a <= '0'; b <= '0'; c <= '1'; d <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '0'; c <= '1'; d <= '1'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; c <= '0'; d <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; c <= '0'; d <= '1'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; c <= '1'; d <= '0'; wait for 1 ns;

&#x20;       a <= '0'; b <= '1'; c <= '1'; d <= '1'; wait for 1 ns;

&#x09;	

&#x20;       a <= '1'; b <= '0'; c <= '0'; d <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; c <= '0'; d <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; c <= '1'; d <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '0'; c <= '1'; d <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; c <= '0'; d <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; c <= '0'; d <= '1'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; c <= '1'; d <= '0'; wait for 1 ns;

&#x20;       a <= '1'; b <= '1'; c <= '1'; d <= '1'; wait for 1 ns;



&#x20;       assert false report "Reached end of test";

&#x20;       wait;

&#x20;   end process;



end test;







## PARITY GENERATOR

**Architecture**

library ieee;

use ieee.std\_logic\_1164.all;



entity pg is

&#x20;   port (

&#x20;       A, B, C : in  std\_logic;

&#x20;       Pe      : out std\_logic;  -- Even parity

&#x20;       Po      : out std\_logic   -- Odd parity

&#x20;   );

end pg;



architecture behave of pg is

begin

&#x20;   process(A, B, C)

&#x20;   begin

&#x20;       Pe <= A xor B xor C;

&#x20;       Po <= not (A xor B xor C);

&#x20;   end process;

end behave;





**Test Bench**

library ieee;

use ieee.std\_logic\_1164.all;



entity pg\_tb is

end pg\_tb;



architecture test of pg\_tb is



&#x20;   component pg

&#x20;       port (

&#x20;           A, B, C : in  std\_logic;

&#x20;           Pe      : out std\_logic;

&#x20;           Po      : out std\_logic

&#x20;       );

&#x20;   end component;



&#x20;   signal A, B, C : std\_logic := '0';

&#x20;   signal Pe, Po  : std\_logic;



begin

&#x20;   parity\_generator : pg

&#x20;       port map (

&#x20;           A  => A,

&#x20;           B  => B,

&#x20;           C  => C,

&#x20;           Pe => Pe,

&#x20;           Po => Po

&#x20;       );



&#x20;   process

&#x20;   begin

&#x20;       A <= '0'; B <= '0'; C <= '0'; wait for 1 ns;

&#x20;       A <= '0'; B <= '0'; C <= '1'; wait for 1 ns;

&#x20;       A <= '0'; B <= '1'; C <= '0'; wait for 1 ns;

&#x20;       A <= '0'; B <= '1'; C <= '1'; wait for 1 ns;

&#x20;       A <= '1'; B <= '0'; C <= '0'; wait for 1 ns;

&#x20;       A <= '1'; B <= '0'; C <= '1'; wait for 1 ns;

&#x20;       A <= '1'; B <= '1'; C <= '0'; wait for 1 ns;

&#x20;       A <= '1'; B <= '1'; C <= '1'; wait for 1 ns;

&#x20;       

&#x09;	assert false report "Reached end of test";

&#x20;       wait;

&#x20;   end process;



end test;







