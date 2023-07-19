LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY flipFlopD IS
    PORT(D, c, e : IN std_logic;
            Q : OUT std_logic
    );
END;

ARCHITECTURE behav OF flipFlopD IS
BEGIN
PROCESS (D, c, e)
BEGIN
    if e = '0' then
        Q <= '0';
    elsif e = '1' then
        IF (c ' EVENT AND c = '1' AND D = '0') THEN
            Q <= '0';
        ELSIF (c ' EVENT AND c = '1' AND D = '1') THEN
            Q <= '1';
        END IF;
    end if;
END PROCESS ;
END;