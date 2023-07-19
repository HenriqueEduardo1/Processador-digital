LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity abext is
    port (
        s1, s0, a, b: in std_logic;
        ia, ib: out std_logic
    );
end abext;

architecture rtl of abext is

begin

    ia <= a;
    ib <= (s0 and b) or (s1 and not(s0) and not(b));

end architecture;