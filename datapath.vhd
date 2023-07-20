LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity datapath is
    port (
        R_data : in std_logic_vector(15 downto 0);
        RF_W_addr, RF_Rp_addr, RF_Rq_addr : in std_logic_vector(3 downto 0);
        RF_W_wr, RF_Rp_rd, RF_Rq_rd, clk : in std_logic;
        alu_s1, alu_s0, DES, E_D, RF_s0, RF_s1 : in std_logic;
        RF_W_data : in std_logic_vector(15 downto 0);
        RF_Rp_zero : out std_logic;
        W_data : out std_logic_vector(15 downto 0)
    );
end datapath;

architecture rtl of datapath is

    component mux3x1_16bits is
        port (
            data0, data1, data2 : in std_logic_vector(15 downto 0);
            s0, s1 : in std_logic;
            S : out std_logic_vector(15 downto 0)
        );
    end component;

    component bancoRegistradores is
        port (
            W_data : in std_logic_vector(15 downto 0);
            W_addr, Rp_addr, Rq_addr : in std_logic_vector(3 downto 0);
            W_wr, Rp_rd, Rq_rd, clk : in std_logic;
            Rp_data, Rq_data: out std_logic_vector(15 downto 0)
        );
    end component;

    component ALU is
        port (
            s0, s1, E_D, DES: in std_logic;
            A, B: in std_logic_vector(15 downto 0);
            res: out std_logic_vector(15 downto 0)
        );
    end component;

    component compZero is
        port (
            data_in : in std_logic_vector(15 downto 0);
            Rp_zero : out std_logic
        );
    end component;
    
    signal resAlu, Smux, SRp_d, SRq_d : std_logic_vector(15 downto 0);
begin

    W_data <= SRp_d;

    mux3x1 : mux3x1_16bits port map(
        data0 => resAlu, 
        data1 => R_data, 
        data2 => RF_W_data, 
        s0 => RF_s0, 
        s1 => RF_s1, 
        S => Smux
    );
    bregs : bancoRegistradores port map(
        W_data => Smux,
        W_addr => RF_W_addr, 
        Rp_addr => RF_Rp_addr, 
        Rq_addr => RF_Rq_addr,
        W_wr => RF_W_wr,
        Rp_rd => RF_Rp_rd,
        Rq_rd => RF_Rq_rd,
        clk => clk,
        Rp_data => SRp_d,
        Rq_data => SRq_d
    );
    cpz : compZero port map(
        data_in => SRp_d, 
        Rp_zero => RF_Rp_zero
    );
    al : ALU port map(
        s0 => alu_s0,
        s1 => alu_s1,
        E_D => E_D,
        DES => DES,
        A => SRp_d, 
        B => SRq_d,
        res => resAlu
    );

end architecture;