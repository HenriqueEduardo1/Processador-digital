library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;	

entity memoriaDeInst is
    port(
        endereco : in std_logic_vector(7 downto 0);
        ce, clk : in std_logic;
        s : out std_logic_vector(15 downto 0)
    );
end memoriaDeInst;
	
architecture hardware of memoriaDeInst  is
	type      arranjo_memoria is array (0 to 2**8 - 1) of std_logic_vector(15 downto 0);
	constant  dados: arranjo_memoria := ("0011000100000001","0011001000000011","0110000100100000","0001000000000001", others => (others => '0'));
	
    signal new_s : std_logic_vector(15 downto 0);
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                new_s <= dados(to_integer(unsigned(endereco)));
            else
                new_s <= (others => '0');
            end if;
        end if;
    end process;
    
	s <= new_s;
end hardware;