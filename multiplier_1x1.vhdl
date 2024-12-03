library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplier_1x1 is
    port (
        A : in STD_LOGIC;  
        B : in STD_LOGIC;  
        P : out STD_LOGIC 
    );
end multiplier_1x1;


architecture Structural of multiplier_1x1 is

    component and_gate
        port (
            X : in STD_LOGIC;
            Y : in STD_LOGIC;
            Z : out STD_LOGIC
        );
    end component;
begin

    U1: and_gate
        port map (
            X => A,
            Y => B,
            Z => P
        );
end Structural;
