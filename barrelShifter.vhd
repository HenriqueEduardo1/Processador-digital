LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity barrelShifter is
    port (
        shL1, shR1, shL2, shR2, shL4, shR4, shL8, shR8 : in std_logic;
        inRa : in std_logic_vector(15 downto 0);
        outRa : out std_logic_vector(15 downto 0)
    );
end barrelShifter;

architecture rtl of barrelShifter is

    component deslocador1bit is
        port (
            shL, shR : in std_logic;
            i : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component deslocador2bits is
        port (
            shL, shR : in std_logic;
            i : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component deslocador4bits is
        port (
            shL, shR : in std_logic;
            i : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component deslocador8bits is
        port (
            shL, shR : in std_logic;
            i : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal s1, s2, s3: std_logic_vector(15 downto 0);

begin

    d8 : deslocador8bits port map(i => inRa, shL => shL8, shR => shR8, q => s1);
    d4 : deslocador4bits port map(i => s1, shL => shL4, shR => shR4, q => s2);
    d2 : deslocador2bits port map(i => s2, shL => shL2, shR => shR2, q => s3);
    d1 : deslocador1bit port map(i => s3, shL => shL1, shR => shR1, q => outRa);

end architecture;