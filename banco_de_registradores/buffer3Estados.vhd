LIBRARY ieee;
USE ieee.std_logic_1164.all ;

entity buffer3Estados is
    port (
        c: in std_logic;
        i : in std_logic_vector(15 downto 0);
        q : out std_logic_vector(15 downto 0)
    );
end buffer3Estados;

architecture rtl of buffer3Estados is

begin

process(c, i)
begin
    q <= "ZZZZZZZZZZZZZZZZ";

    if(c = '1') then
        q <= i;
    end if;
end process;

end architecture;