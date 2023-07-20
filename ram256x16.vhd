LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram256x16 is
    port (
        addr : in std_logic_vector(7 downto 0);
        W_data : in std_logic_vector(15 downto 0);
        wr : in std_logic;
        rd : in std_logic;
        R_data : out std_logic_vector(15 downto 0);
        clk : in std_logic
    );
end ram256x16;

architecture behavioral of ram256x16 is

    type ram_array is array (0 to 255) of std_logic_vector(15 downto 0);
    signal memory : ram_array;

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if wr = '1' then
                memory(to_integer(unsigned(addr))) <= W_data;
            end if;
            
            if rd = '1' then
                R_data <= memory(to_integer(unsigned(addr)));
            end if;
        end if;
    end process;
end behavioral;
