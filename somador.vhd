LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity somador is
    port (
        ra, rb : in std_logic_vector(15 downto 0);
        S : out std_logic_vector(15 downto 0);
        co : out std_logic;
        cin : in std_logic
    );
end somador;

architecture rtl of somador is

    component full_adder is
        port (
            a, b, ci : in std_logic;
            s, co : out std_logic
        );
    end component;

    signal ci : std_logic_vector(14 downto 0);

begin
    
    fa0 : full_adder port map(a => ra(0), b => rb(0),ci => cin ,  s => S(0), co => ci(0));
    fa1 : full_adder port map(a => ra(1), b => rb(1),ci => ci(0), s => S(1), co => ci(1));
    fa2 : full_adder port map(a => ra(2), b => rb(2),ci => ci(1), s => S(2), co => ci(2));
    fa3 : full_adder port map(a => ra(3), b => rb(3),ci => ci(2), s => S(3), co => ci(3));
    fa4 : full_adder port map(a => ra(4), b => rb(4),ci => ci(3), s => S(4), co => ci(4));
    fa5 : full_adder port map(a => ra(5), b => rb(5),ci => ci(4), s => S(5), co => ci(5));
    fa6 : full_adder port map(a => ra(6), b => rb(6),ci => ci(5), s => S(6), co => ci(6));
    fa7 : full_adder port map(a => ra(7), b => rb(7),ci => ci(6), s => S(7), co => ci(7));
    fa8 : full_adder port map(a => ra(8), b => rb(8),ci => ci(7), s => S(8), co => ci(8));
    fa9 : full_adder port map(a => ra(9), b => rb(9),ci => ci(8), s => S(9), co => ci(9));
    fa10 : full_adder port map(a => ra(10), b => rb(10),ci => ci(9), s => S(10), co => ci(10));
    fa11 : full_adder port map(a => ra(11), b => rb(11),ci => ci(10), s => S(11), co => ci(11));
    fa12 : full_adder port map(a => ra(12), b => rb(12),ci => ci(11), s => S(12), co => ci(12));
    fa13 : full_adder port map(a => ra(13), b => rb(13),ci => ci(12), s => S(13), co => ci(13));
    fa14 : full_adder port map(a => ra(14), b => rb(14),ci => ci(13), s => S(14), co => ci(14));
    fa15 : full_adder port map(a => ra(15), b => rb(15),ci => ci(14), s => S(15), co => co);

end architecture;