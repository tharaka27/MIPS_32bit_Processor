--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_processor is
--  Port ( );
end tb_processor;

architecture Behavioral of tb_processor is

    component processor is
      Port (
            clk                     : in std_logic;
            reset                   : in std_logic;
            PC_output               : out std_logic_vector(31 downto 0);
            opCode_output           : out std_logic_vector(5 downto 0);
            Bus_A_ALU_output        : out std_logic_vector(31 downto 0);
            Bus_B_ALU_output        : out std_logic_vector(31 downto 0)
       );
    end component processor;
    
     signal clk                     : std_logic := '1';
     signal reset                   : std_logic;
     signal PC_output               : std_logic_vector(31 downto 0);
     signal opCode_output           : std_logic_vector(5 downto 0);
     signal Bus_A_ALU_output        : std_logic_vector(31 downto 0);
     signal Bus_B_ALU_output        : std_logic_vector(31 downto 0);

begin
    clk <= not clk after 5ns;
    reset <= '0';

UUT : processor port map(
    clk                => clk,
    reset              => reset,
    PC_output          => PC_output,
    opCode_output      => opCode_output,
    Bus_A_ALU_output   => Bus_A_ALU_output,
    Bus_B_ALU_output   => Bus_B_ALU_output
);

end Behavioral;
