LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity processador is
    port (
        clk : in std_logic;
        saida, IR_out : out std_logic_vector(15 downto 0);
        RF_W_data : out std_logic_vector(15 downto 0);
        D_addr : out std_logic_vector(7 downto 0);
        D_rd , D_wr : out std_logic;
        RF_W_addr, RF_Rp_addr, RF_Rq_addr, PC_out : out std_logic_vector(3 downto 0);
        RF_W_wr, RF_Rp_rd, RF_Rq_rd : out std_logic;
        RF_s1, RF_s0 : out std_logic;
        DES, E_D, alu_s1, alu_s0, I_rd : out std_logic
    );
end processador;

architecture rtl of processador is

    component unidadeDeControle is
        port (
            RF_Rp_zero, clk : in std_logic;
            data : in std_logic_vector(15 downto 0);
            RF_W_data : out std_logic_vector(15 downto 0);
            D_addr : out std_logic_vector(7 downto 0);
            D_rd , D_wr : out std_logic;
            RF_W_addr, RF_Rp_addr, RF_Rq_addr, PC_out : out std_logic_vector(3 downto 0);
            RF_W_wr, RF_Rp_rd, RF_Rq_rd : out std_logic;
            RF_s1, RF_s0 : out std_logic;
            DES, E_D, alu_s1, alu_s0, I_rd : out std_logic;
            IR_out : out std_logic_vector(15 downto 0)
        );
    end component;

    component datapath is
        port (
            R_data : in std_logic_vector(15 downto 0);
            RF_W_addr, RF_Rp_addr, RF_Rq_addr : in std_logic_vector(3 downto 0);
            RF_W_wr, RF_Rp_rd, RF_Rq_rd, clk : in std_logic;
            alu_s1, alu_s0, DES, E_D, RF_s0, RF_s1 : in std_logic;
            RF_W_data : in std_logic_vector(15 downto 0);
            RF_Rp_zero : out std_logic;
            W_data, saida : out std_logic_vector(15 downto 0)
        );
    end component;

    component ram256x16 is
        port (
            addr : in std_logic_vector(7 downto 0);
            W_data : in std_logic_vector(15 downto 0);
            wr : in std_logic;
            rd : in std_logic;
            R_data : out std_logic_vector(15 downto 0);
            clk : in std_logic
        );
    end component;

    component memoriaDeInst is
        port( 
            endereco : in std_logic_vector(3 downto 0);
            ce, clk : in std_logic;
            s : out std_logic_vector(15 downto 0)
        );
    end component;

    signal data_s, IR_saida : std_logic_vector(15 downto 0);
    signal RF_W_data_s : std_logic_vector(15 downto 0);
    signal D_addr_s : std_logic_vector(7 downto 0);
    signal D_rd_s , D_wr_s : std_logic;
    signal RF_W_addr_s, RF_Rp_addr_s, RF_Rq_addr_s, PC_out_s : std_logic_vector(3 downto 0);
    signal RF_W_wr_s, RF_Rp_rd_s, RF_Rq_rd_s : std_logic;
    signal RF_s1_s, RF_s0_s, RF_Rp_zero_s : std_logic;
    signal DES_s, E_D_s, alu_s1_s, alu_s0_s, I_rd_s : std_logic;

    signal addr_s : std_logic_vector(7 downto 0);
    signal W_data_s, R_data_s : std_logic_vector(15 downto 0);
    signal wr_s, rd_s : std_logic;

begin

    IR_out <= IR_saida;

    RF_W_data <= RF_W_data_s;
    PC_out <= PC_out_s;
    D_addr <= D_addr_s;
    D_rd <= D_rd_s;
    D_wr <= D_wr_s;
    RF_W_addr <= RF_W_addr_s;
    RF_Rp_addr <= RF_Rp_addr_s;
    RF_Rq_addr <= RF_Rq_addr_s;
    RF_W_wr <= RF_W_wr_s;
    RF_Rp_rd <= RF_Rp_rd_s;
    RF_Rq_rd <= RF_Rq_rd_s;
    RF_s1 <= RF_s1_s;
    RF_s0 <= RF_s0_s;
    DES <= DES_s;
    E_D <= E_D_s;
    alu_s1 <= alu_s1_s;
    alu_s0 <= alu_s0_s;
    I_rd <= I_rd_s;

    memoI : memoriaDeInst port map(
        clk => clk, endereco => PC_out_s, ce => I_rd_s, s => data_s
    );

    uniC : unidadeDeControle port map(
        RF_Rp_zero => RF_Rp_zero_s, clk => clk,
        data => data_s,
        RF_W_data => RF_W_data_s, PC_out => PC_out_s,
        D_addr => D_addr_s, D_rd => D_rd_s , D_wr => D_wr_s,
        RF_W_addr => RF_W_addr_s, RF_Rp_addr => RF_Rp_addr_s, RF_Rq_addr => RF_Rq_addr_s,
        RF_W_wr => RF_W_wr_s, RF_Rp_rd => RF_Rp_rd_s, RF_Rq_rd => RF_Rq_rd_s,
        RF_s1 => RF_s1_s, RF_s0 => RF_s0_s,
        DES => DES_s, E_D => E_D_s, alu_s1 => alu_s1_s, alu_s0 => alu_s0_s, I_rd => I_rd_s,
        IR_out => IR_saida
    );

    ram : ram256x16 port map(
        addr => D_addr_s, W_data => W_data_s,
        wr => D_wr_s, rd => D_rd_s,
        R_data => R_data_s, clk => clk
    );

    dataP : datapath port map(
        R_data => R_data_s,
        RF_W_addr => RF_W_addr_s, RF_Rp_addr => RF_Rp_addr_s, RF_Rq_addr => RF_Rq_addr_s,
        RF_W_wr => RF_W_wr_s, RF_Rp_rd => RF_Rp_rd_s, RF_Rq_rd => RF_Rq_rd_s, clk => clk,
        alu_s1 => alu_s1_s, alu_s0 => alu_s0_s, DES => DES_s, 
        E_D => E_D_s, RF_s0 => RF_s0_s, RF_s1 => RF_s1_s,
        RF_W_data => RF_W_data_s,
        RF_Rp_zero => RF_Rp_zero_s, 
        W_data => W_data_s,
        saida => saida
    );

end architecture;