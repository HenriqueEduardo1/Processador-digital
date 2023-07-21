library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;	

entity memoriaDeInst is
    port(
        endereco : in std_logic_vector(3 downto 0);
        ce, clk : in std_logic;
        s : out std_logic_vector(15 downto 0)
    );
end memoriaDeInst;
	
architecture hardware of memoriaDeInst  is
	type      arranjo_memoria is array (0 to 2**4 - 1) of std_logic_vector(15 downto 0);
	constant  dados: arranjo_memoria := ("0011000100000001","0011001000000011","0111000100100000","0001000000000001", others => (others => '0'));
	
    signal new_s : std_logic_vector(15 downto 0);
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                new_s <= dados(to_integer(unsigned(endereco)));
            end if;
        end if;
    end process;
    
	s <= new_s;
end hardware;