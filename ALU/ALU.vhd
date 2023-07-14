LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ALU is
    port (
        s0, s1, E_D, DES: in std_logic;
        A, B: in std_logic_vector(15 downto 0);
        res: out std_logic_vector(15 downto 0)
    );
end ALU;

architecture rtl of ALU is
    constant zero : std_logic_vector(15 downto 0) := "0000000000000000";

    component barrelShifter is
        port (
            shL1, shR1, shL2, shR2, shL4, shR4, shL8, shR8 : in std_logic;
            inRa : in std_logic_vector(15 downto 0);
            outRa : out std_logic_vector(15 downto 0)
        );
    end component;
    component circuito_deslocador is
        port (
            E_D : in std_logic;
            rb : in std_logic_vector(15 downto 0);
            shL1, shR1, shL2, shR2, shL4, shR4, shL8, shR8 : out std_logic
        );
    end component;
    component extensorAL is
        port (
            s1, s0: in std_logic;
            cin : out std_logic;
            ra, rb: in std_logic_vector(15 downto 0);
            ira, irb: out std_logic_vector(15 downto 0)
        );
    end component;
    component mux2x1 is
        port (
            s : in std_logic;
            A, B: in std_logic_vector(15 downto 0);
            d : out std_logic_vector(15 downto 0)
        );
    end component;
    component somador is
        port (
            ra, rb : in std_logic_vector(15 downto 0);
            S : out std_logic_vector(15 downto 0);
            co : out std_logic;
            cin : in std_logic
        );
    end component;
    
    signal SA, SB, inB, outA : std_logic_vector(15 downto 0);
    signal s_m : std_logic_vector(15 downto 0);
    signal L1, R1, L2, R2, L4, R4, L8, R8, inM : std_logic;

begin

    inB <= B;

    mux: mux2x1 port map(s => DES, A => zero, B => inB, d => s_m);
    cd: circuito_deslocador port map(E_D => E_D, rb => s_m, shL1 => L1, shR1 => R1, shL2 => L2, shR2 => R2, shL4 => L4, shR4 => R4, shL8 => L8, shR8 => R8);
    bs: barrelShifter port map(shL1 => L1, shR1 => R1, shL2 => L2, shR2 => R2, shL4 => L4, shR4 => R4, shL8 => L8, shR8 => R8, inRa => A, outRa => outA);
    ext: extensorAL port map(s1 => s1, s0 => s0, cin => inM, ra => outA, rb => B, ira => SA, irb => SB);
    sum: somador port map(ra => SA, rb => SB, S => res, cin => inM);

end architecture;