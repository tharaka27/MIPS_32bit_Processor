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
          instruction_output      : out std_logic_vector(31 downto 0);  
          functionPointer_output  : out std_logic_vector(5 downto 0);  
          rs_output               : out std_logic_vector(4 downto 0);
          rt_output               : out std_logic_vector(4 downto 0);
          rd_output               : out std_logic_vector(4 downto 0);  
          readData1_output        : out std_logic_vector(31 downto 0);
          readData2_output        :out  std_logic_vector(31 downto 0);
          readData1Out_output     :out std_logic_vector(31 downto 0);
          readData2Out_output     : out std_logic_vector(31 downto 0);    
          regDst_output           : out std_logic;
          ALUSrc_output           : out std_logic;
          MemToReg_output         :out  std_logic;
          RegWrite_output         : out std_logic;
          memRead_output          : out std_logic;
          memWrite_output         : out std_logic;
          branch_output           : out std_logic;
          Jump_output             : out std_logic;
          signZero_output         : out  std_logic;
          JRControl_output        : out std_logic;
          ForwardA_output         : out std_logic_vector(1 downto 0);
          ForwardB_output         : out std_logic_vector(1 downto 0);    
          flush_output            : out std_logic
            
       );
    end component processor;
    
        signal clk                     : std_logic := '0';
        signal reset                   : std_logic;
        signal PC_output               : std_logic_vector(31 downto 0);
        signal opCode_output           :  std_logic_vector(5 downto 0);
        signal Bus_A_ALU_output        :  std_logic_vector(31 downto 0);
        signal Bus_B_ALU_output        :  std_logic_vector(31 downto 0);
        signal instruction_output      :  std_logic_vector(31 downto 0);  
        signal functionPointer_output  :  std_logic_vector(5 downto 0);  
        signal rs_output               :  std_logic_vector(4 downto 0);
        signal rt_output               :  std_logic_vector(4 downto 0);
        signal rd_output               :  std_logic_vector(4 downto 0);  
        signal readData1_output        :  std_logic_vector(31 downto 0);
        signal readData2_output        :  std_logic_vector(31 downto 0);
        signal readData1Out_output     : std_logic_vector(31 downto 0);
        signal readData2Out_output     :  std_logic_vector(31 downto 0);    
        signal regDst_output           :  std_logic;
        signal ALUSrc_output           :  std_logic;
        signal MemToReg_output         :  std_logic;
        signal RegWrite_output         :  std_logic;
        signal memRead_output          :  std_logic;
        signal memWrite_output         :  std_logic;
        signal branch_output           :  std_logic;
        signal Jump_output             :  std_logic;
        signal signZero_output         :   std_logic;
        signal JRControl_output        :  std_logic;
        signal ForwardA_output         :  std_logic_vector(1 downto 0);
        signal ForwardB_output         :  std_logic_vector(1 downto 0);    
        signal flush_output            :  std_logic;
    

begin
    clk <= not clk after 5ns;
    
    TB : process 
        begin 
        --wait for 2.5ns;
        reset <= '1';
        wait for 5ns;
        reset <= '0';       
      wait;
    end process;

    UUT : processor port map(
        clk                => clk,
        reset              => reset,
        PC_output               =>PC_output,
        opCode_output            =>opCode_output,
        Bus_A_ALU_output         =>Bus_A_ALU_output,
        Bus_B_ALU_output         =>Bus_B_ALU_output,
        instruction_output       =>instruction_output,  
        functionPointer_output   =>functionPointer_output,  
        rs_output                =>rs_output,
        rt_output                =>rt_output,
        rd_output                =>rd_output,  
        readData1_output         =>readData1_output,
        readData2_output         =>readData2_output,
        readData1Out_output      =>readData1Out_output,
        readData2Out_output      =>readData2Out_output,   
        regDst_output            =>regDst_output,
        ALUSrc_output            =>ALUSrc_output,
        MemToReg_output          =>MemToReg_output,
        RegWrite_output          =>RegWrite_output,
        memRead_output           =>memRead_output,
        memWrite_output          =>memWrite_output,
        branch_output            =>branch_output,
        Jump_output              =>Jump_output,
        signZero_output          =>signZero_output,
        JRControl_output         =>JRControl_output,
        ForwardA_output          =>ForwardA_output,
        ForwardB_output          =>ForwardB_output,    
        flush_output             =>flush_output
    );

end Behavioral;