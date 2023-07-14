LIBRARY ieee;
USE ieee.std_logic_1164.all ;

entity bancoRegistradores is
    port (
        W_data : in std_logic_vector(15 downto 0);
        W_addr, Rp_addr, Rq_addr : in std_logic_vector(3 downto 0);
        W_wr, Rp_rd, Rq_rd, clk : in std_logic;
        Rp_data, Rq_data : out std_logic_vector(15 downto 0)
    );
end bancoRegistradores;

architecture rtl of bancoRegistradores is

    component decodificador4X16 is
        port (
            e : in std_logic;
            i : in std_logic_vector(3 downto 0);
            d : out std_logic_vector(15 downto 0)
        );
    end component;
    component registrador16bits is
        port(
            clk, load : in std_logic;
            i : in std_logic_vector(15 downto 0);
            Q : out std_logic_vector(15 downto 0)
        );
    end component;
    component buffer3Estados is
        port (
            c: in std_logic;
            i : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;
    
    type nested_vector is array (natural range <>) of std_logic_vector(15 downto 0);

    signal fR : nested_vector(15 downto 0);
    signal fregD, fb3eA, fb3eB : std_logic_vector(15 downto 0);
    
begin

    decEsc : decodificador4X16 port map(e => W_wr, i => W_addr, d => fregD);
    decRDA : decodificador4X16 port map(e => Rp_rd, i => Rp_addr, d => fb3eA);
    decRDB : decodificador4X16 port map(e => Rq_rd, i => Rq_addr, d => fb3eB);

    gen_regs : for i in 0 to 15 generate
        reg : registrador16bits port map(clk => clk, load => fregD(i), i => W_data, Q => fR(i));
        b3eA : buffer3Estados port map(c => fb3eA(i), i => fR(i), q => Rp_data);
        b3eB : buffer3Estados port map(c => fb3eB(i), i => fR(i), q => Rq_data );
    end generate gen_regs;

end architecture;