library verilog;
use verilog.vl_types.all;
entity processador is
    port(
        clk             : in     vl_logic;
        saida           : out    vl_logic_vector(15 downto 0);
        IR_out          : out    vl_logic_vector(15 downto 0);
        RF_W_data       : out    vl_logic_vector(15 downto 0);
        D_addr          : out    vl_logic_vector(7 downto 0);
        D_rd            : out    vl_logic;
        D_wr            : out    vl_logic;
        RF_W_addr       : out    vl_logic_vector(3 downto 0);
        RF_Rp_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rq_addr      : out    vl_logic_vector(3 downto 0);
        PC_out          : out    vl_logic_vector(3 downto 0);
        RF_W_wr         : out    vl_logic;
        RF_Rp_rd        : out    vl_logic;
        RF_Rq_rd        : out    vl_logic;
        RF_s1           : out    vl_logic;
        RF_s0           : out    vl_logic;
        DES             : out    vl_logic;
        E_D             : out    vl_logic;
        alu_s1          : out    vl_logic;
        alu_s0          : out    vl_logic;
        I_rd            : out    vl_logic;
        out_ra          : out    vl_logic_vector(3 downto 0);
        out_rb          : out    vl_logic_vector(3 downto 0);
        out_rc          : out    vl_logic_vector(3 downto 0);
        out_w           : out    vl_logic_vector(15 downto 0)
    );
end processador;
