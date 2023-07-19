library ieee;
use ieee.std_logic_1164.all;

entity regEstados4bits is
    port (
        clk: in std_logic;
        n: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0)
    );
end entity regEstados4bits;

architecture rtl of regEstados4bits is
    signal new_s: std_logic_vector(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            new_s <= n;
        end if;
    end process;
    
    s <= new_s;
end architecture rtl;
