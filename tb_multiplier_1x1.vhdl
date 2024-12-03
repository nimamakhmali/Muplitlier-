library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_multiplier_1x1 is
end tb_multiplier_1x1;

architecture sim of tb_multiplier_1x1 is
    signal A, B : STD_LOGIC;
    signal P : STD_LOGIC;
begin

    uut: entity work.multiplier_1x1
        port map (
            A => A,
            B => B,
            P => P
        );


    process
    begin

        A <= '0'; B <= '0';
        wait for 10 ns;


        A <= '0'; B <= '1';
        wait for 10 ns;

    
        A <= '1'; B <= '0';
        wait for 10 ns;


        A <= '1'; B <= '1';
        wait for 10 ns;

        wait;
    end process;
end sim;
