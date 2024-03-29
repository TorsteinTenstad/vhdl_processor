library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_adder_tb is
    Generic(n : integer := 8);
end n_bit_adder_tb;



architecture Behavioral of n_bit_adder_tb is

component n_bit_adder is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           sum : out STD_LOGIC_VECTOR (n-1 downto 0);
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

signal A : STD_LOGIC_VECTOR (n-1 downto 0);
signal B : STD_LOGIC_VECTOR (n-1 downto 0);
signal sum : STD_LOGIC_VECTOR (n-1 downto 0);
signal overflow : STD_LOGIC;

begin

UUT : n_bit_adder
    generic map(n => n)
    port map(A => A, 
             B => B, 
             sum => sum, 
             carry_in => '0',
             carry_out => overflow);

process
begin
    A <= "01101010";
    B <= "01011010";
    wait for 1 ns;
    A <= "01111001";
    B <= "00100011";
    wait for 1 ns;
    A <= "11111111";
    B <= "00000000";
    wait for 1 ns;
    A <= "11111111";
    B <= "11111111";
    wait for 1 ns;
end process;
end Behavioral;
