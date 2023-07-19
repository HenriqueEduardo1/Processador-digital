library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contadorDePrograma is
    port(
        PC_ld, PC_clr, PC_inc, clk : in std_logic;
        PC_offset : in std_logic_vector(7 downto 0);
        count : out std_logic_vector(7 downto 0)
    );
end entity contadorDePrograma;

architecture rtl of contadorDePrograma is
    signal count_out : signed(7 downto 0);
begin
    process(clk)
    begin
        if PC_clr = '1' then
            count_out <= (others => '0');
        elsif rising_edge(clk) then
            if PC_ld = '1' then
                count_out <= count_out + signed(PC_offset) - 1;
            elsif PC_inc = '1' then
                count_out <= count_out + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(count_out);
end architecture rtl;
