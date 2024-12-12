library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    port( 
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC 
    );
    end or_gate;

architecture structural of or_gate is
begin 
    Y <= A or B;
end structural;    