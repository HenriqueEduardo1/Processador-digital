LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2x1De4bits is
    port (
        s : in std_logic;
        A, B: in std_logic_vector(3 downto 0);
        d : out std_logic_vector(3 downto 0)
    );
end mux2x1De4bits;

architecture rtl of mux2x1De4bits is
    
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