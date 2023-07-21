library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bancoRegistradores is
    Port ( clk        : in  std_logic;
           W_addr     : in  std_logic_vector(3 downto 0);
           W_data     : in  std_logic_vector(15 downto 0);
           W_wr       : in  std_logic;
           Rp_addr    : in  std_logic_vector(3 downto 0);
           Rq_addr    : in  std_logic_vector(3 downto 0);
           Rp_rd      : in  std_logic;
           Rq_rd      : in  std_logic;
           Rp_data    : out std_logic_vector(15 downto 0);
           Rq_data    : out std_logic_vector(15 downto 0)
        );
end bancoRegistradores;

architecture Behavioral of bancoRegistradores is
    type register_array is array (0 to 15) of std_logic_vector(15 downto 0);
    signal registers : register_array;
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if W_wr = '1' then
                registers(conv_integer(unsigned(W_addr))) <= W_data;
            end if;
            
            if Rp_rd = '1' then
                Rp_data <= registers(conv_integer(unsigned(Rp_addr)));
            end if;
            
            if Rq_rd = '1' then
                Rq_data <= registers(conv_integer(unsigned(Rq_addr)));
            end if;

        end if;
    end process;

end Behavioral;
