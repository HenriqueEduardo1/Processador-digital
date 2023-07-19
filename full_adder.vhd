LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity full_adder is
    port (
        a, b, ci : in std_logic;
        s, co : out std_logic
    );
end full_adder;

architecture rtl of full_adder is

    component half_adder is
        port (
            a, b : in std_logic;
            s, co : out std_logic
        );
    end component;

    signal c1, c2, c3 : std_logic;

begin

    ha1: half_adder port map(a => a, b => b, s => c1, co => c2);
    ha2: half_adder port map(a => c1, b => ci, s => s, co => c3);
    co <= c2 or c3;

end architecture;