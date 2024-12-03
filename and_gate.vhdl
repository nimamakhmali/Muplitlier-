library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port (
        X : in STD_LOGIC;  
        Y : in STD_LOGIC;  
        Z : out STD_LOGIC  
    );
end and_gate;


architecture structural of and_gate is
begin
    Z <= X and Y;
end structural;
