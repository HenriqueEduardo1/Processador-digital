LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2x1 is
    port (
        s : in std_logic;
        A, B: in std_logic_vector(15 downto 0);
        d : out std_logic_vector(15 downto 0)
    );
end mux2x1;

architecture rtl of mux2x1 is
    
begin

    process (s, A, B)
    begin
        if s = '0' then
            d <= A;
        elsif s = '1' then
            d <= B;
        end if;
    end process;

end architecture;