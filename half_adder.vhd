LIBRARY ieee;
USE ieee.std_logic_1164.all ;

entity half_adder is
    port (
        a, b : in std_logic;
        s, co : out std_logic
    );
end half_adder;

architecture rtl of half_adder is
begin
    s <= a xor b;
    co <= a and b;
end architecture;