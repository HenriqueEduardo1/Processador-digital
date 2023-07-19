LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY registrador16bits IS
    PORT(
        clk, load : in std_logic;
        i : in  std_logic_vector(15 downto 0);
        Q : out std_logic_vector(15 downto 0)
    );
END;

ARCHITECTURE behav OF registrador16bits IS

    COMPONENT flipFlopD IS
        PORT(
            D, c, e : IN std_logic;
            Q : OUT std_logic
        );
    END COMPONENT;

BEGIN

    ffd0: flipFlopD port map(D => i(0), c => clk, e => load, Q => Q(0));
    ffd1: flipFlopD port map(D => i(1), c => clk, e => load, Q => Q(1));
    ffd2: flipFlopD port map(D => i(2), c => clk, e => load, Q => Q(2));
    ffd3: flipFlopD port map(D => i(3), c => clk, e => load, Q => Q(3));
    ffd4: flipFlopD port map(D => i(4), c => clk, e => load, Q => Q(4));
    ffd5: flipFlopD port map(D => i(5), c => clk, e => load, Q => Q(5));
    ffd6: flipFlopD port map(D => i(6), c => clk, e => load, Q => Q(6));
    ffd7: flipFlopD port map(D => i(7), c => clk, e => load, Q => Q(7));
    ffd8: flipFlopD port map(D => i(8), c => clk, e => load, Q => Q(8));
    ffd9: flipFlopD port map(D => i(9), c => clk, e => load, Q => Q(9));
    ffd10: flipFlopD port map(D => i(10), c => clk, e => load, Q => Q(10));
    ffd11: flipFlopD port map(D => i(11), c => clk, e => load, Q => Q(11));
    ffd12: flipFlopD port map(D => i(12), c => clk, e => load, Q => Q(12));
    ffd13: flipFlopD port map(D => i(13), c => clk, e => load, Q => Q(13));
    ffd14: flipFlopD port map(D => i(14), c => clk, e => load, Q => Q(14));
    ffd15: flipFlopD port map(D => i(15), c => clk, e => load, Q => Q(15));

END;