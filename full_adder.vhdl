library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (
    in1 , in2 , c_in : in std_logic ;
    sum  : out std_logic ;
    c_out : out std_logic
    );
end entity;

architecture structural of full_adder is

    component half_adder is
        port (
            x,y : in std_logic;
            sum , carry : out std_logic
        );
    end component half_adder;
    
    component or_gate is
        port (
            x,y : in std_logic;
            z : out std_logic
        );
    end component or_gate;
    
    signal s1 , s2 , s3 : std_logic;
    begin
        H1 : half_adder port map(x => in1, y => in2, sum => s1, carry => s3);
        H2 : half_adder port map(x => s1, y => c_in, sum => sum, carry => s2);
        O1 : or_gate port map(x => s2, y => s3, z => c_out);
        
end architecture structural;    