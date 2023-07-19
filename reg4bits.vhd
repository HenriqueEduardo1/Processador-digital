library ieee;
use ieee.std_logic_1164.all;

entity reg4bits is
    port (
        clk: in std_logic;
        load: in std_logic;
        d: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0)
    );
end entity reg4bits;

architecture rtl of reg4bits is
    signal new_s: std_logic_vector(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if load = '1' then
                new_s <= d;
            end if;
        end if;
    end process;
    
    s <= new_s;
end architecture rtl;
