LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity cinext is
    port (
        s1, s0: in std_logic;
        cin: out std_logic
    );
end cinext;

architecture rtl of cinext is

begin

    cin <= s1 and not(s0);

end architecture;