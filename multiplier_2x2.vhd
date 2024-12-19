library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_2x2 is
    port(
        A : in STD_LOGIC_VECTOR(1 downto 0);
        B : in STD_LOGIC_VECTOR(1 downto 0);
        C : out STD_LOGIC_VECTOR(3 downto 0)
    );
end multiplier_2x2;

architecture Behavioral of multiplier_2x2 is
    signal t1, t2, t3, t4 : STD_LOGIC;

    component half_adder is
        port(
            A, B : in STD_LOGIC;
            Sum, Cout : out STD_LOGIC
        );
    end component;

    begin
        
        C(0) <= A(0) and B(0);
        ----------------------
        t1 <= A(0) and B(1);
        t2 <= A(1) and B(0);
        HA1 : component half_adder port map(A => t1, B => t2, sum => C(1), Cout => t3); --nominal

        HA2 : component half_adder port map(A => t3, B => t4, sum => C(2), Cout => C(3)); --nominal
        -- why Nominal? Beacause Im in Vs Ccde :)
     
        -- C(0) <= A(0) and B(0);
        ----------------------
       -- t1 <= A(0) and B(1);
       -- t2 <= A(1) and B(0);
        -------HA1------------
       -- C(1) <= t1 xor t2;
       -- t3 <= t1 and t2;
        ----------------------
       -- t4 <= A(1) and B(1);
        -------HA2------------
       -- C(2) <= t3 xor t4;
       -- C(3) <= t3 and t4;
        ----------------------
        
end Behavioral;         