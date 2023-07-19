LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux3x1 is
    port (
      D0, D1, D2 : in std_logic;  
      S0, S1 : in std_logic;      
      d : out std_logic           
    );
end mux3x1;
  
architecture rtl of mux3x1 is

begin
    process (S0, S1)
    begin
        if S1 = '0' and S0 = '0' then
            d <= D0;
        elsif S1 = '0' and S0 = '1' then
            d <= D1;
        elsif S1 = '1' and S0 = '0' then
            d <= D2;
        end if;
    end process;
end architecture;