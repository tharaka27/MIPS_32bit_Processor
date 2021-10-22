library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x32to32 is
Port ( 
        A : in std_logic_vector (31 downto 0);
        B : in std_logic_vector (31 downto 0);
        Sel : in std_logic;
        Output : out std_logic_vector (31 downto 0)
      );
end mux2x32to32;

architecture Behavioral of mux2x32to32 is
    component mux_2to1
      Port (
          inA : in std_logic;
          inB : in std_logic;
          sel : in std_logic;
          output : out std_logic
         );
    end component;
begin

G_1: for i in 0 to 31 generate
    MUXi:mux_2to1 port map (
        inA => A(i),
        inB => B(i),
        sel => Sel,
        output => Output(i)
    );
end generate;

end Behavioral;
