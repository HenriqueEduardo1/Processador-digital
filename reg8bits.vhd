library ieee;
use ieee.std_logic_1164.all;

entity reg8bits is
    port (
        clk: in std_logic;
        load: in std_logic;
        d: in std_logic_vector(7 downto 0);
        s: out std_logic_vector(7 downto 0)
    );
end entity reg8bits;

architecture rtl of reg8bits is
    signal new_s: std_logic_vector(7 downto 0);
begin
    process(load)
    begin
        if rising_edge(load) then
            new_s <= d;
        end if;
    end process;
    
    s <= new_s;
end architecture rtl;
