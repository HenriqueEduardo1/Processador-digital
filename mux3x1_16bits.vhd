LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux3x1_16bits is
    port (
        data0, data1, data2 : in std_logic_vector(15 downto 0);
        s0, s1 : in std_logic;
        S : out std_logic_vector(15 downto 0)
    );
end mux3x1_16bits;

architecture behavioral of mux3x1_16bits is
begin
    process (data0, data1, data2, s0, s1)
    begin
        if (s1 = '0' and s0 = '0') then
            S <= data0;
        elsif (s1 = '0' and s0 = '1') then
            S <= data1;
        elsif (s1 = '1' and s0 = '0') then
            S <= data2;
        else
            S <= (others => '0');
        end if;
    end process;
end behavioral;
