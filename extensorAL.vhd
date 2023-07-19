LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity extensorAL is
    port (
        s1, s0: in std_logic;
        cin : out std_logic;
        ra, rb: in std_logic_vector(15 downto 0);
        ira, irb: out std_logic_vector(15 downto 0)
    );
end extensorAL;

architecture rtl of extensorAL is

    component abext is
        port (
            s1, s0, a, b: in std_logic;
            ia, ib: out std_logic
        );
    end component;

    component cinext is
        port (
            s1, s0: in std_logic;
            cin: out std_logic
        );
    end component;

begin

    ab0: abext port map (s0 => s0, s1 => s1, a => ra(0), b => rb(0), ia => ira(0), ib => irb(0));
    ab1: abext port map (s0 => s0, s1 => s1, a => ra(1), b => rb(1), ia => ira(1), ib => irb(1));
    ab2: abext port map (s0 => s0, s1 => s1, a => ra(2), b => rb(2), ia => ira(2), ib => irb(2));
    ab3: abext port map (s0 => s0, s1 => s1, a => ra(3), b => rb(3), ia => ira(3), ib => irb(3));
    ab4: abext port map (s0 => s0, s1 => s1, a => ra(4), b => rb(4), ia => ira(4), ib => irb(4));
    ab5: abext port map (s0 => s0, s1 => s1, a => ra(5), b => rb(5), ia => ira(5), ib => irb(5));
    ab6: abext port map (s0 => s0, s1 => s1, a => ra(6), b => rb(6), ia => ira(6), ib => irb(6));
    ab7: abext port map (s0 => s0, s1 => s1, a => ra(7), b => rb(7), ia => ira(7), ib => irb(7));
    ab8: abext port map (s0 => s0, s1 => s1, a => ra(8), b => rb(8), ia => ira(8), ib => irb(8));
    ab9: abext port map (s0 => s0, s1 => s1, a => ra(9), b => rb(9), ia => ira(9), ib => irb(9));
    ab10: abext port map (s0 => s0, s1 => s1, a => ra(10), b => rb(10), ia => ira(10), ib => irb(10));
    ab11: abext port map (s0 => s0, s1 => s1, a => ra(11), b => rb(11), ia => ira(11), ib => irb(11));
    ab12: abext port map (s0 => s0, s1 => s1, a => ra(12), b => rb(12), ia => ira(12), ib => irb(12));
    ab13: abext port map (s0 => s0, s1 => s1, a => ra(13), b => rb(13), ia => ira(13), ib => irb(13));
    ab14: abext port map (s0 => s0, s1 => s1, a => ra(14), b => rb(14), ia => ira(14), ib => irb(14));
    ab15: abext port map (s0 => s0, s1 => s1, a => ra(15), b => rb(15), ia => ira(15), ib => irb(15));

    ci: cinext port map (s0 => s0, s1 => s1, cin => cin);

end architecture;