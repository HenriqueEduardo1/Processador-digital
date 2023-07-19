LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity logicaCombinacional is
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
end logicaCombinacional;

architecture rtl of logicaCombinacional is



begin

    n(0) <= (not(s(1)) and not(s(0))) or 
            (not(s(0)) and not(op(2)) and not(op(0))) or 
            (not(s(0)) and not(op(1)) and not(op(0))) or 
            (not(s(0)) and op(2) and op(1) and op(0)) or 
            (s(1) and s(0)) or s(2) or s(3);

    n(1) <= (not(s(3)) and not(s(2)) and not(s(1)) and s(0)) or 
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and not(op(1)) and not(op(0))) or 
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and op(1) and op(0)) or 
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and op(2) and not(op(0)));

    n(2) <= (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and not(op(2)) and op(0)) or 
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and not(op(2)) and op(1)) or 
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and op(2) and not(op(1)));

    n(3) <= (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and op(2) and op(0)) or
            (not(s(3)) and not(s(2)) and s(1) and not(s(0)) and op(2) and op(1)) or
            (s(3) and not(s(2)) and not(s(1)) and not(s(0)) and RF_Rp_zero);

    PC_ld <= s(3) and not(s(2)) and not(s(1)) and s(0);

    PC_clr <= not(s(3)) and not(s(2)) and not(s(1)) and not(s(0));

    PC_inc <= not(s(3)) and not(s(2)) and not(s(1)) and s(0);

    I_rd <= not(s(3)) and not(s(2)) and not(s(1)) and s(0);

    IR_ld <= not(s(3)) and not(s(2)) and not(s(1)) and s(0);

    D_addr_ld <= (not(s(3)) and not(s(2)) and s(1) and s(0)) or (not(s(3)) and s(2) and not(s(1)) and not(s(0)));

    D_rd <= (not(s(3)) and not(s(2)) and s(1) and s(0)); 

    D_wr <= (not(s(3)) and s(2) and not(s(1)) and not(s(0)));

    RF_W_data_ld <= (not(s(3)) and s(2) and s(1) and not(s(0)));

    RF_W_addr_ld <= (not(s(3)) and s(0) and (s(1) xor s(2))) or (s(1) and (s(2) xor s(3)));

    s0_RF_W_addr <= not(s(3)) and ((s(0) and (s(1) xor s(2))) or (s(2) and s(1)));

    RF_W_wr <= (not(s(3)) and s(0) and (s(1) xor s(2))) or (s(1) and (s(2) xor s(3)));

    RF_s1 <= (not(s(3)) and s(2) and s(1) and not(s(0)));

    RF_s0 <= (not(s(3)) and not(s(2)) and s(1) and s(0));

    RF_Rp_addr_ld <= (not(s(3)) and s(2) and (not(s(1)) or (s(1) and s(0)))) or (s(3) and not(s(2)) and (not(s(0)) or (s(1) and s(0))));

    s0_RF_Rp_addr <= (not(s(3)) and s(2) and not(s(1)) and not(s(0))) or (s(3) and not(s(2)) and (not(s(0)) or (s(1) and s(0))));

    RF_Rp_rd <= (not(s(3)) and s(2) and (not(s(1)) or (s(1) and s(0)))) or (s(3) and not(s(2)) and (not(s(0)) or (s(1) and s(0))));

    RF_Rq_addr_ld <= (not(s(3)) and s(2) and s(0)) or (s(3) and not(s(2)) and s(1));

    s0_RF_Rq_addr <= (s(3) and not(s(2)) and s(1) and not(s(0))) or (s(3) and not(s(2)) and s(1) and s(0));

    RF_Rq_rd <= (not(s(3)) and s(2) and s(0)) or (s(3) and not(s(2)) and s(1));

    DES <= (s(3) and not(s(2)) and s(1) and not(s(0))) or (s(3) and not(s(2)) and s(1) and s(0));

    E_D <= (s(3) and not(s(2)) and s(1) and not(s(0)));

    alu_s1 <= (not(s(3)) and s(2) and s(1) and s(0));

    alu_s0 <= (not(s(3)) and s(2) and not(s(1)) and s(0));
end architecture;