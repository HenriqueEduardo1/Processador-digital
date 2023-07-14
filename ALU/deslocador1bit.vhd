LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity deslocador1bit is
    port (
        shL, shR : in std_logic;
        i : in std_logic_vector(15 downto 0);
        q : out std_logic_vector(15 downto 0)
    );
end deslocador1bit;

architecture rtl of deslocador1bit is

    component mux3x1 is
        port (
          D0, D1, D2 : in std_logic;  
          S0, S1 : in std_logic;      
          d : out std_logic           
        );
    end component;

    signal inR, inL : std_logic;
    signal il, ir : std_logic_vector(15 downto 0);

begin

    inR <= '0';
    inL <= '0';
    il <= i;
    ir <= i;

    m1 : mux3x1 port map(D0 => i(0), D1 => inL, D2 => ir(1), S0 => shL, S1 => shR, d => q(0));
    m2 : mux3x1 port map(D0 => i(1), D1 => il(0), D2 => ir(2), S0 => shL, S1 => shR, d => q(1));
    m3 : mux3x1 port map(D0 => i(2), D1 => il(1), D2 => ir(3), S0 => shL, S1 => shR, d => q(2));
    m4 : mux3x1 port map(D0 => i(3), D1 => il(2), D2 => ir(4), S0 => shL, S1 => shR, d => q(3));
    m5 : mux3x1 port map(D0 => i(4), D1 => il(3), D2 => ir(5), S0 => shL, S1 => shR, d => q(4));
    m6 : mux3x1 port map(D0 => i(5), D1 => il(4), D2 => ir(6), S0 => shL, S1 => shR, d => q(5));
    m7 : mux3x1 port map(D0 => i(6), D1 => il(5), D2 => ir(7), S0 => shL, S1 => shR, d => q(6));
    m8 : mux3x1 port map(D0 => i(7), D1 => il(6), D2 => ir(8), S0 => shL, S1 => shR, d => q(7));
    m9 : mux3x1 port map(D0 => i(8), D1 => il(7), D2 => ir(9), S0 => shL, S1 => shR, d => q(8));
    m10 : mux3x1 port map(D0 => i(9), D1 => il(8), D2 => ir(10), S0 => shL, S1 => shR, d => q(9));
    m11 : mux3x1 port map(D0 => i(10), D1 => il(9), D2 => ir(11), S0 => shL, S1 => shR, d => q(10));
    m12 : mux3x1 port map(D0 => i(11), D1 => il(10), D2 => ir(12), S0 => shL, S1 => shR, d => q(11));
    m13 : mux3x1 port map(D0 => i(12), D1 => il(11), D2 => ir(13), S0 => shL, S1 => shR, d => q(12));
    m14 : mux3x1 port map(D0 => i(13), D1 => il(12), D2 => ir(14), S0 => shL, S1 => shR, d => q(13));
    m15 : mux3x1 port map(D0 => i(14), D1 => il(13), D2 => ir(15), S0 => shL, S1 => shR, d => q(14));
    m16 : mux3x1 port map(D0 => i(15), D1 => il(14), D2 => inR, S0 => shL, S1 => shR, d => q(15));

end architecture;