library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplier_4x4_tb is
end multiplier_4x4_tb;

architecture Structural of multiplier_4x4_tb is
    component multiplier_4x4
        port(
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            C : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal C : STD_LOGIC_VECTOR(7 downto 0);

begin
    UUT: multiplier_4x4 port map(A => A, B => B, C => C);
    
    stimulus: process
    begin
        A <= "0001"; B <= "0010";
        wait for 10 ns;
        A <= "0011"; B <= "0101";
        wait for 10 ns;
        A <= "1111"; B <= "1111";
        wait for 10 ns;
        A <= "1010"; B <= "0101";
        wait for 10 ns;
        wait;
    end process stimulus;
end Structural;