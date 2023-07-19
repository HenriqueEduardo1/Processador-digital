LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity compZero is
    port (
        data_in : in std_logic_vector(15 downto 0);
        Rp_zero : out std_logic
    );
end compZero;

architecture rtl of compZero is

begin

    Rp_zero <= '1' when (data_in = "0000000000000000") else '0';

end rtl;
