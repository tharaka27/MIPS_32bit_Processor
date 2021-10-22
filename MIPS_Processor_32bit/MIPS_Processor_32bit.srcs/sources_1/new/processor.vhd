--
-- Written by Tharaka Ratnayake & Vihan Melaka
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
  Port (
        clk         : in std_logic;
        reset       : in std_logic
   );
end processor;

architecture Behavioral of processor is
        
        signal PC   : std_logic_vector(31 downto 0);
        signal PCin   : std_logic_vector(31 downto 0);
        signal PC4   : std_logic_vector(31 downto 0);
        signal ID_PC4   : std_logic_vector(31 downto 0);
        signal EX_PC4   : std_logic_vector(31 downto 0);
        
        -- pc signals in mux
        signal PCbne   : std_logic_vector(31 downto 0);
        signal PCj   : std_logic_vector(31 downto 0);
        signal PC4bnej   : std_logic_vector(31 downto 0);
        signal PCjr   : std_logic_vector(31 downto 0);
        
        -- output of instruction memory
        signal instruction   : std_logic_vector(31 downto 0);
        signal ID_instruction   : std_logic_vector(31 downto 0);
        signal EX_instruction   : std_logic_vector(31 downto 0);
        
        -- Opcode, function
        signal opCode   : std_logic_vector(5 downto 0);
        signal functionPointer : std_logic_vector(5 downto 0);
        
        
        -- extend
        signal imm16   : std_logic_vector(15 downto 0);
        signal Im16_Ext   : std_logic_vector(31 downto 0);
        signal EX_Im16_Ext   : std_logic_vector(31 downto 0);
        signal sign_ext_out  : std_logic_vector(31 downto 0);
        signal zero_ext_out   : std_logic_vector(31 downto 0);
        
        -- regfile
        signal rs : std_logic_vector(4 downto 0);
        signal rt   : std_logic_vector(4 downto 0);
        signal rd   : std_logic_vector(4 downto 0);
        signal Ex_rs   : std_logic_vector(4 downto 0);
        signal Ex_rt   : std_logic_vector(4 downto 0);
        signal Ex_rd   : std_logic_vector(4 downto 0);
        signal Ex_writeRegister   : std_logic_vector(4 downto 0);
        signal Mem_writeRegister  : std_logic_vector(4 downto 0);
        signal WB_writeRegister   : std_logic_vector(31 downto 0);
        
        
        signal WB_writeData   : std_logic_vector(31 downto 0);
        signal readData1   : std_logic_vector(31 downto 0);
        signal readData2   : std_logic_vector(31 downto 0);
        signal readDataOut1   : std_logic_vector(31 downto 0);
        signal readDataOut2   : std_logic_vector(31 downto 0);
        signal exReadData1   : std_logic_vector(31 downto 0);
        signal exReadData2   : std_logic_vector(31 downto 0);

        -- ALU
        signal Bus_A_ALU   : std_logic_vector(31 downto 0);
        signal Bus_B_ALU   : std_logic_vector(31 downto 0);
        signal Bus_B_forwarded   : std_logic_vector(31 downto 0);
        signal Ex_ALUResult  : std_logic_vector(31 downto 0);
        signal MEM_ALUResult   : std_logic_vector(31 downto 0);
        signal WB_ALUResult   : std_logic_vector(31 downto 0);
        signal zeroFlag   : std_logic;
        signal overflowFlag   : std_logic;
        signal carryFlag : std_logic;
        signal negativeFlag   : std_logic;
        signal notZeroFlag   : std_logic;
        
        signal writeDataOfMem   : std_logic_vector(31 downto 0);
        signal Mem_readDataOfMem   : std_logic_vector(31 downto 0);
        signal WB_readDataOfMem   : std_logic_vector(31 downto 0);
        
        -- Control signals
        signal regDst   : std_logic;
        signal ALUSrc   : std_logic;
        signal MemToReg   : std_logic;
        signal RegWrite   : std_logic;
        signal memRead  : std_logic;
        signal memWrite   : std_logic;
        signal branch   : std_logic;
        signal Jump : std_logic;
        signal signZero :  std_logic;
        signal JRControl : std_logic;
        
        
        -- instruction decode phase
        signal ID_RegDst : std_logic;
        signal ID_ALUSrc : std_logic;
        signal ID_MemtoReg : std_logic;
        signal ID_RegWrite : std_logic;
        signal ID_MemRead : std_logic;
        signal ID_MemWrite : std_logic;
        signal ID_Branch : std_logic;
        signal ID_JRControl : std_logic;
        
        -- Execution phase
        signal Ex_RegDst : std_logic;
        signal Ex_ALUSrc : std_logic;
        signal Ex_MemtoReg : std_logic;
        signal Ex_RegWrite : std_logic;
        signal Ex_MemRead : std_logic;
        signal Ex_MemWrite : std_logic;
        signal Ex_Branch : std_logic;
        signal Ex_JRControl : std_logic;

        -- Memory phase
        signal Mem_MemtoReg : std_logic;
        signal Mem_RegWrite : std_logic;
        signal Mem_MemRead : std_logic;
        signal Mem_MemWrite : std_logic;
        
        -- Write back phase
        signal WB_MemtoReg : std_logic;
        signal WB_RegWrite : std_logic;
         
        signal ALUOp   : std_logic_vector(1 downto 0);
        signal ID_ALUOp   : std_logic_vector(1 downto 0);
        signal Ex_ALUOp   : std_logic_vector(1 downto 0);
        signal ALUControl   : std_logic_vector(1 downto 0);
        signal bneControl : std_logic;
        signal notbneControl : std_logic;
        signal jumpControl : std_logic;
        signal jumpFlush : std_logic;
        
        signal ForwardA   : std_logic_vector(1 downto 0);
        signal ForwardB   : std_logic_vector(1 downto 0);
        
        
        signal IF_Flush : std_logic;
        signal IFID_Flush : std_logic;
        signal notIFID_Flush : std_logic;
        signal stall_Flush : std_logic;
        signal flush : std_logic;
        
        signal shiftLeft2_bne_out   : std_logic_vector(31 downto 0);
        signal shiftLeft2_jump_out   : std_logic_vector(31 downto 0);

        signal PC_WriteEn : std_logic;
        signal IFID_WriteEn : std_logic;
        
        -- PC register
        component register_32bit is
          Port (
            regOut  :   out std_logic_vector(31 downto 0);
            regData :   in  std_logic_vector(31 downto 0);
            writeEn :   in  std_logic;
            reset   :   in  std_logic;
            clk     :   in  std_logic
           );
        end component register_32bit;

        component adder_32bit is
          Port (
            A : in std_logic_vector (31 downto 0);
            B : in std_logic_vector (31 downto 0) ;
            S : out std_logic_vector (31 downto 0);
            C_out : out std_logic
           );
        end component adder_32bit;
        
        component instruction_memory is
          Port ( addr : in std_logic_vector( 4 downto 0 );
                 data : out std_logic_vector( 31 downto 0 ) 
          );
        end component instruction_memory;
        
        component reg_bit is
          Port ( 
                bitOut  :   out std_logic;
                bitData :   in  std_logic;
                writeEn :   in  std_logic;
                reset   :   in  std_logic;
                clk     :   in  std_logic
          );
        end component reg_bit;
        
        
        component control_unit is
          Port (
                regDst          : out   std_logic;
                ALUSrc          : out   std_logic;
                memToReg        : out   std_logic;
                regWrite        : out   std_logic;
                memRead         : out   std_logic;
                memWrite        : out   std_logic;
                branch          : out   std_logic;
                jump            : out   std_logic;
                signZero        : out   std_logic;
                ALUOp           : out   std_logic_vector(1 downto 0);
                opCode          : in    std_logic_vector(5 downto 0)
           );
        end component control_unit;

begin

    PC_register : register_32bit port map(
                regOut => PC,
                regData => PCin,
                writeEn => PC_WriteEn,
                reset   => reset,
                clk     => clk
    );
    
    PC_adder    : adder_32bit port map(
                A   => PC,
                B   => "00000000000000000000000000000100",
                S   => PC4
                
    );
    
    
    -- Wrong need to be changed
    ins_memory  : instruction_memory port map(
                addr => PC,
                data => instruction
    
    );
    
    
    IFID_PC4 : register_32bit port map(
                regOut => ID_PC4,
                regData => PC4,
                writeEn => IFID_WriteEn,
                reset   => reset,
                clk     => clk
     );

    IFID_Instruction : register_32bit port map(
                regOut => ID_Instruction,
                regData => instruction,
                writeEn => IFID_WriteEn,
                reset   => reset,
                clk     => clk
     );
     
     IF_flush_bit   : reg_bit port map( 
             bitOut  =>   IFID_Flush,
             bitData =>  IF_flush,
             writeEn =>   IFID_WriteEn,
             reset   =>   reset,
             clk     =>  clk
       );
     
     -- ID stage
     
     opCode <= instruction(31 downto 26);
     functionPointer <= instruction(5 downto 0);
     rs <= instruction(25 downto 21);
     rt <= instruction(20 downto 16);
     rd <= instruction(15 downto 11);
     imm16 <= instruction(15 downto 0);

     main_control : control_unit port map(
                regDst          => regDst,
                ALUSrc          => ALUSrc,
                memToReg        => MemToReg,
                regWrite        => RegWrite,
                memRead         => memRead,
                memWrite        => memWrite,
                branch          => branch,
                jump            => Jump,
                signZero        => signZero,
                ALUOp           => ALUOp,
                opCode          => opCode
           );
     

end Behavioral;
