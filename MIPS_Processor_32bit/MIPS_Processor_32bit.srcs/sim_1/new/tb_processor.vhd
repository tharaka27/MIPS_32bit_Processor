--
-- Written by Tharaka Ratnayake & Vihan Melaka
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
            Bus_B_ALU_output        : out std_logic_vector(31 downto 0);
            test31_1        : out std_logic_vector(31 downto 0);
            test32_2        : out std_logic_vector(31 downto 0);
            test5_1        : out std_logic_vector(4 downto 0);
            test5_2        : out std_logic_vector(4 downto 0);
            test_1 : out std_logic;
                       test_2 : out std_logic;
                        test_3 : out std_logic; 
                        test_4 : out std_logic;
                         test_5 :out  std_logic;
                          test_6 :out std_logic;
                           test_7 : out std_logic;
                            test_8 : out std_logic
       );
    end component processor;
    
     signal clk                     : std_logic := '1';
     signal reset                   : std_logic;
     signal PC_output               : std_logic_vector(31 downto 0);
     signal opCode_output           : std_logic_vector(5 downto 0);
     signal Bus_A_ALU_output        : std_logic_vector(31 downto 0);
     signal Bus_B_ALU_output        : std_logic_vector(31 downto 0);
     signal test31_1        : std_logic_vector(31 downto 0);
     signal test32_2        : std_logic_vector(31 downto 0);
      signal test5_1        :  std_logic_vector(4 downto 0);
    signal test5_2        :  std_logic_vector(4 downto 0);
    signal test_1 : std_logic;
               signal test_2 : std_logic;
                signal test_3 : std_logic; 
                signal test_4 : std_logic;
                signal test_5 : std_logic;
                 signal test_6 : std_logic;
                  signal  test_7 : std_logic;
                   signal  test_8 : std_logic;

begin
    clk <= not clk after 5ns;
    
    TB : process 
        begin 
        --reset <= '0';
        --wait for 5ns;
        reset <= '0';
        wait for 2.5ns;
        reset <= '1';
        wait for 5ns;
        reset <= '0';
                wait for 5ns;
                reset <= '1';
                wait for 5ns;
                reset <= '0';       
      wait;
    end process;

    UUT : processor port map(
        clk                => clk,
        reset              => reset,
        PC_output          => PC_output,
        opCode_output      => opCode_output,
        Bus_A_ALU_output   => Bus_A_ALU_output,
        Bus_B_ALU_output   => Bus_B_ALU_output,
        test31_1 => test31_1,
        test32_2 => test32_2,
        test5_1 => test5_1,
        test5_2 => test5_2,
        test_1 => test_1,
                       test_2 => test_2,
                        test_3 => test_3, 
                        test_4 => test_4,
                         test_5 => test_5,
                          test_6 => test_6,
                           test_7 => test_7,
                            test_8 => test_8
        
    );

end Behavioral;