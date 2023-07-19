LIBRARY ieee;
USE ieee.std_logic_1164.all ;

entity unidadeDeControle is
    port (
        RF_Rp_zero, clk : in std_logic;
        data : in std_logic_vector(15 downto 0);
        RF_W_data : out std_logic_vector(15 downto 0);
        D_addr, PC_out : out std_logic_vector(7 downto 0);
        D_rd , D_wr : out std_logic;
        RF_W_addr, RF_Rp_addr, RF_Rq_addr : out std_logic_vector(3 downto 0);
        RF_W_wr, RF_Rp_rd, RF_Rq_rd : out std_logic;
        RF_s1, RF_s0 : out std_logic;
        DES, E_D, alu_s1, alu_s0, I_rd : out std_logic
    );
end unidadeDeControle;

architecture rtl of unidadeDeControle is

    component blocoDeControle is
        port (
            RF_Rp_zero, clk : in std_logic;
            IR : in std_logic_vector(15 downto 0);
            RF_W_data : out std_logic_vector(15 downto 0);
            D_addr : out std_logic_vector(7 downto 0);
            D_rd , D_wr : out std_logic;
            RF_W_addr, RF_Rp_addr, RF_Rq_addr : out std_logic_vector(3 downto 0);
            RF_W_wr, RF_Rp_rd, RF_Rq_rd : out std_logic;
            RF_s1, RF_s0 : out std_logic;
            DES, E_D, alu_s1, alu_s0 : out std_logic;
            PC_ld, PC_clr, PC_inc : out std_logic;
            I_rd, IR_ld : out std_logic
        );
    end component;

    component contadorDePrograma is
        port(
            PC_ld, PC_clr, PC_inc, clk : in std_logic;
            PC_offset : in std_logic_vector(7 downto 0);
            count : out std_logic_vector(7 downto 0)
        );
    end component;

    component reg16bits is
        port (
            clk: in std_logic;
            load: in std_logic;
            d: in std_logic_vector(15 downto 0);
            s: out std_logic_vector(15 downto 0)
        );
    end component;

    signal PC_ld_s, PC_clr_s, PC_inc_s, IR_ld_s : std_logic;
    signal IR_s : std_logic_vector(15 downto 0);
    signal offset : std_logic_vector(7 downto 0);

begin

    offset(7) <= IR_s(7);
    offset(6) <= IR_s(6);
    offset(5) <= IR_s(5);
    offset(4) <= IR_s(4);
    offset(3) <= IR_s(3);
    offset(2) <= IR_s(2);
    offset(1) <= IR_s(1);
    offset(0) <= IR_s(0);

    BC : blocoDeControle port map(
        RF_Rp_zero => RF_Rp_zero, clk => clk, IR => IR_s,
        RF_W_data => RF_W_data,
        D_addr => D_addr,
        D_rd => D_rd , D_wr => D_wr,
        RF_W_addr => RF_W_addr, RF_Rp_addr => RF_Rp_addr, RF_Rq_addr => RF_Rq_addr,
        RF_W_wr => RF_W_wr, RF_Rp_rd => RF_Rp_rd, RF_Rq_rd => RF_Rq_rd,
        RF_s1 => RF_s1, RF_s0 => RF_s0,
        DES => DES, E_D => E_D, alu_s1 => alu_s1, alu_s0 => alu_s0,
        PC_ld => PC_ld_s, PC_clr => PC_clr_s, PC_inc => PC_inc_s,
        I_rd => I_rd, IR_ld => IR_ld_s
    );

    contP : contadorDePrograma port map(
        PC_ld => PC_ld_s, PC_clr => PC_clr_s, PC_inc => PC_inc_s, 
        clk => clk, PC_offset => offset,
        count => PC_out
    );

    IR : reg16bits port map(
        clk => clk, load => IR_ld_s,
        d => data, s => IR_s 
    );

end architecture;