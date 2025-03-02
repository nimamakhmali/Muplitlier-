library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_multiplier_2x2 is
end tb_multiplier_2x2;

architecture behavioral of tb_multiplier_2x2 is

    component multiplier_2x2
        port(
            A : in STD_LOGIC_VECTOR(1 downto 0);
            B : in STD_LOGIC_VECTOR(1 downto 0);
            C : in STD_LOGIC_VECTOR(3 downto 0);
        );
    end component;
    
    signal A_tb: STD_LOGIC_VECTOR(1 downto 0): = (others =>'0');
    signal B_tb: STD_LOGIC_VECTOR(1 downto 0): = (others =>'0');   
    signal C_tb: STD_LOGIC_VECTOR(3 downto 0);

    begin

        uut:multiplier_2x2 port map(
            A => A_tb;
            B => B_tb;
            C => C_tb;
        );

    end architecture;        