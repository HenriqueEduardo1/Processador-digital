library verilog;
use verilog.vl_types.all;
entity processador_vlg_check_tst is
    port(
        alu_s0          : in     vl_logic;
        alu_s1          : in     vl_logic;
        D_addr          : in     vl_logic_vector(7 downto 0);
        D_rd            : in     vl_logic;
        D_wr            : in     vl_logic;
        DES             : in     vl_logic;
        E_D             : in     vl_logic;
        I_rd            : in     vl_logic;
        IR_out          : in     vl_logic_vector(15 downto 0);
        out_ra          : in     vl_logic_vector(3 downto 0);
        out_rb          : in     vl_logic_vector(3 downto 0);
        out_rc          : in     vl_logic_vector(3 downto 0);
        out_w           : in     vl_logic_vector(15 downto 0);
        PC_out          : in     vl_logic_vector(3 downto 0);
        RF_Rp_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rp_rd        : in     vl_logic;
        RF_Rq_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rq_rd        : in     vl_logic;
        RF_s0           : in     vl_logic;
        RF_s1           : in     vl_logic;
        RF_W_addr       : in     vl_logic_vector(3 downto 0);
        RF_W_data       : in     vl_logic_vector(15 downto 0);
        RF_W_wr         : in     vl_logic;
        saida           : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador_vlg_check_tst;
