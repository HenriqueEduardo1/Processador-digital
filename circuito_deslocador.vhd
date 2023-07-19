LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity circuito_deslocador is
    port (
        E_D : in std_logic;
        rb : in std_logic_vector(15 downto 0);
        shL1, shR1, shL2, shR2, shL4, shR4, shL8, shR8 : out std_logic
    );
end circuito_deslocador;

architecture rtl of circuito_deslocador is

begin

    shL1 <= not(E_D) and rb(0);
    shR1 <= E_D and rb(0);
    shL2 <= not(E_D) and rb(1);
    shR2 <= E_D and rb(1);
    shL4 <= not(E_D) and rb(2);
    shR4 <= E_D and rb(2);
    shL8 <= not(E_D) and rb(3);
    shR8 <= E_D and rb(3);

end architecture;