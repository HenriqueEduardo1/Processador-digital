LIBRARY ieee;
USE ieee.std_logic_1164.all ;

entity blocoDeControle is
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
end blocoDeControle;

architecture rtl of blocoDeControle is

    component logicaCombinacional is
        port (
            op, s : in std_logic_vector(3 downto 0);
            RF_Rp_zero : in std_logic;
            RF_W_data_ld, D_addr_ld, D_rd , D_wr : out std_logic;
            RF_W_addr_ld, s0_RF_W_addr, RF_W_wr : out std_logic;
            RF_Rp_addr_ld, s0_RF_Rp_addr, RF_Rp_rd : out std_logic;
            RF_Rq_addr_ld, s0_RF_Rq_addr, RF_Rq_rd : out std_logic;
            RF_s1, RF_s0 : out std_logic;
            DES, E_D, alu_s1, alu_s0 : out std_logic;
            PC_ld, PC_clr, PC_inc : out std_logic;
            I_rd, IR_ld : out std_logic;
            n : out std_logic_vector(3 downto 0)
        );
    end component;

    component regEstados4bits is
        port (
            clk: in std_logic;
            n: in std_logic_vector(3 downto 0);
            s: out std_logic_vector(3 downto 0)
        );
    end component regEstados4bits;

    component reg16bits is
        port (
            clk: in std_logic;
            load: in std_logic;
            d: in std_logic_vector(15 downto 0);
            s: out std_logic_vector(15 downto 0)
        );
    end component reg16bits;

    component reg8bits is
        port (
            clk: in std_logic;
            load: in std_logic;
            d: in std_logic_vector(7 downto 0);
            s: out std_logic_vector(7 downto 0)
        );
    end component reg8bits;

    component reg4bits is
        port (
            clk: in std_logic;
            load: in std_logic;
            d: in std_logic_vector(3 downto 0);
            s: out std_logic_vector(3 downto 0)
        );
    end component reg4bits;

    component mux2x1De4bits is
        port (
            s : in std_logic;
            A, B: in std_logic_vector(3 downto 0);
            d : out std_logic_vector(3 downto 0)
        );
    end component;

    signal n_s, s_s, opc, ra, rb, rc, mx0_s, mx1_s, mx2_s : std_logic_vector(3 downto 0);
    signal f : std_logic_vector(2 downto 0);
    signal D_s : std_logic_vector(7 downto 0);
    signal RF_W_s : std_logic_vector(15 downto 0);
    signal RF_W_addr_ld_s, RF_Rp_addr_ld_s, RF_Rq_addr_ld_s, RF_W_data_ld_s, D_addr_ld_s : std_logic;
    signal f_RF_W_addr, f_RF_Rp_addr, f_RF_Rq_addr : std_logic;
begin

    opc <= IR(15 downto 12);
    ra <= IR(11 downto 8);
    rb <= IR(7 downto 4);
    rc <= IR(3 downto 0);           

    D_s <= IR(7 downto 0);

    RF_W_s(7 downto 0) <= IR(7 downto 0);
    RF_W_s(15 downto 8) <= (others => '0');

    LC : logicaCombinacional port map(
        op => opc, s => s_s,
        RF_Rp_zero => RF_Rp_zero,
        RF_W_data_ld => RF_W_data_ld_s, D_addr_ld => D_addr_ld_s, D_rd => D_rd , D_wr => D_wr,
        RF_W_addr_ld => RF_W_addr_ld_s, s0_RF_W_addr => f_RF_W_addr, RF_W_wr => RF_W_wr, 
        RF_Rp_addr_ld => RF_Rp_addr_ld_s, s0_RF_Rp_addr => f_RF_Rp_addr, RF_Rp_rd => RF_Rp_rd,
        RF_Rq_addr_ld => RF_Rq_addr_ld_s, s0_RF_Rq_addr => f_RF_Rq_addr, RF_Rq_rd => RF_Rq_rd, 
        RF_s1 => RF_s1, RF_s0 => RF_s0,
        DES => DES, E_D => E_D, alu_s1 => alu_s1, alu_s0 => alu_s0, 
        PC_ld => PC_ld, PC_clr => PC_clr, PC_inc => PC_inc, 
        I_rd => I_rd, IR_ld => IR_ld, 
        n => n_s
    );

    regE : regEstados4bits port map(clk => clk, n => n_s, s => s_s);

    mx4b0 : mux2x1De4bits port map(s => f_RF_W_addr, A => rc, B => ra, d => mx0_s);
    mx4b1 : mux2x1De4bits port map(s => f_RF_Rp_addr, A => ra, B => rb, d => mx1_s);
    mx4b2 : mux2x1De4bits port map(s => f_RF_Rq_addr, A => rb, B => rc, d => mx2_s);

    reg0 : reg4bits port map(clk => clk, load => RF_W_addr_ld_s, d => mx0_s, s => RF_W_addr);
    reg1 : reg4bits port map(clk => clk, load => RF_Rp_addr_ld_s, d => mx1_s, s => RF_Rp_addr);
    reg2 : reg4bits port map(clk => clk, load => RF_Rq_addr_ld_s, d => mx2_s, s => RF_Rq_addr);

    reg3 : reg8bits port map(clk => clk, load => D_addr_ld_s, d => D_s, s => D_addr);

    reg4 : reg16bits port map(clk => clk, load => RF_W_data_ld_s, d => RF_W_s, s => RF_W_data);

end architecture;