library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_4x4 is
    port(
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        C : out STD_LOGIC_VECTOR(7 downto 0)
    );
end multiplier_4x4;

architecture Structural of multiplier_4x4 is
    component multiplier_2x2
        port(
            A : in STD_LOGIC_VECTOR(1 downto 0);
            B : in STD_LOGIC_VECTOR(1 downto 0);
            C : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    signal P0, P1, P2, P3 : STD_LOGIC_VECTOR(3 downto 0);
    signal S1, S2 : STD_LOGIC_VECTOR(3 downto 0);
    signal Carry1, Carry2 : STD_LOGIC_VECTOR(3 downto 0);
    
    component adder_4bit
        port(
            A, B : in STD_LOGIC_VECTOR(3 downto 0);
            Sum : out STD_LOGIC_VECTOR(3 downto 0);
            Carry : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
begin
    -- 
    U1: multiplier_2x2 port map(A => A(1 downto 0), B => B(1 downto 0), C => P0);
    U2: multiplier_2x2 port map(A => A(3 downto 2), B => B(1 downto 0), C => P1);
    U3: multiplier_2x2 port map(A => A(1 downto 0), B => B(3 downto 2), C => P2);
    U4: multiplier_2x2 port map(A => A(3 downto 2), B => B(3 downto 2), C => P3);
    
    -- 
    ADD1: adder_4bit port map(A => P1, B => P2, Sum => S1, Carry => Carry1);
    ADD2: adder_4bit port map(A => S1, B => P3, Sum => S2, Carry => Carry2);
    
    -- 
    C(1 downto 0) <= P0(1 downto 0);
    C(3 downto 2) <= S1(1 downto 0);
    C(5 downto 4) <= S2(1 downto 0);
    C(7 downto 6) <= Carry2(1 downto 0);
end Structural;
