LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity buffer3Estados is
    port (
        c : in  std_logic;       -- Enable signal
        i : in  std_logic_vector(15 downto 0); -- Input data
        q : out std_logic_vector(15 downto 0) -- Output data
    );
end entity buffer3Estados;

architecture Behavioral of buffer3Estados is
begin
    process (c, i)
    begin
        if c = '1' then
            q <= i;
        else
            q <= (others => 'Z'); -- High Impedance state
        end if;
    end process;
end architecture Behavioral;
