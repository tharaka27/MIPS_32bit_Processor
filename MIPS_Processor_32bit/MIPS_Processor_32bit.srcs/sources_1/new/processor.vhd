--
-- Written by Tharaka Ratnayake & Vihan Melaka
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
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
end processor;

architecture Behavioral of processor is
        
        signal PC           : std_logic_vector(31 downto 0);
        signal PCin         : std_logic_vector(31 downto 0);
        signal PC4          : std_logic_vector(31 downto 0);
        signal ID_PC4       : std_logic_vector(31 downto 0);
        signal EX_PC4       : std_logic_vector(31 downto 0);
        
        -- pc signals in mux
        signal PCbne        : std_logic_vector(31 downto 0);
        signal PCj          : std_logic_vector(31 downto 0);
        signal PC4bnej      : std_logic_vector(31 downto 0);
        signal PCjr         : std_logic_vector(31 downto 0);
        signal PC4bne       : std_logic_vector(31 downto 0);
        
        -- output of instruction memory
        signal instruction      : std_logic_vector(31 downto 0);
        signal ID_instruction   : std_logic_vector(31 downto 0);
        signal EX_instruction   : std_logic_vector(31 downto 0);
        
        -- Opcode, function
        signal opCode           : std_logic_vector(5 downto 0);
        signal functionPointer  : std_logic_vector(5 downto 0);
        
        
        -- extend
        signal imm16            : std_logic_vector(15 downto 0);
        signal Im16_Ext         : std_logic_vector(31 downto 0);
        signal EX_Im16_Ext      : std_logic_vector(31 downto 0);
        signal sign_ext_out     : std_logic_vector(31 downto 0);
        signal zero_ext_out     : std_logic_vector(31 downto 0);
        
        -- regfile
        signal rs                   : std_logic_vector(4 downto 0);
        signal rt                   : std_logic_vector(4 downto 0);
        signal rd                   : std_logic_vector(4 downto 0);
        signal Ex_rs                : std_logic_vector(4 downto 0);
        signal Ex_rt                : std_logic_vector(4 downto 0);
        signal Ex_rd                : std_logic_vector(4 downto 0);
        signal Ex_writeRegister     : std_logic_vector(4 downto 0);
        signal Mem_writeRegister    : std_logic_vector(4 downto 0);
        signal WB_writeRegister     : std_logic_vector(4 downto 0);
        
        
        signal WB_writeData         : std_logic_vector(31 downto 0);
        signal readData1            : std_logic_vector(31 downto 0);
        signal readData2            : std_logic_vector(31 downto 0);
        signal readData1Out         : std_logic_vector(31 downto 0);
        signal readData2Out         : std_logic_vector(31 downto 0);
        signal exReadData1          : std_logic_vector(31 downto 0);
        signal exReadData2          : std_logic_vector(31 downto 0);

        -- ALU
        signal Bus_A_ALU            : std_logic_vector(31 downto 0);
        signal Bus_B_ALU            : std_logic_vector(31 downto 0);
        signal Bus_B_forwarded      : std_logic_vector(31 downto 0);
        signal Ex_ALUResult         : std_logic_vector(31 downto 0);
        signal MEM_ALUResult        : std_logic_vector(31 downto 0);
        signal WB_ALUResult         : std_logic_vector(31 downto 0);
        signal zeroFlag             : std_logic;
        signal overflowFlag         : std_logic;
        signal carryFlag            : std_logic;
        signal negativeFlag         : std_logic;
        signal notZeroFlag          : std_logic;
        
        signal writeDataOfMem       : std_logic_vector(31 downto 0);
        signal Mem_readDataOfMem    : std_logic_vector(31 downto 0);
        signal WB_readDataOfMem     : std_logic_vector(31 downto 0);
        
        -- Control signals
        signal regDst       : std_logic;
        signal ALUSrc       : std_logic;
        signal MemToReg     : std_logic;
        signal RegWrite     : std_logic;
        signal memRead      : std_logic;
        signal memWrite     : std_logic;
        signal branch       : std_logic;
        signal Jump         : std_logic;
        signal signZero     :  std_logic;
        signal JRControl    : std_logic;
        
        
        -- instruction decode phase
        signal ID_RegDst    : std_logic;
        signal ID_ALUSrc    : std_logic;
        signal ID_MemtoReg  : std_logic;
        signal ID_RegWrite  : std_logic;
        signal ID_MemRead   : std_logic;
        signal ID_MemWrite  : std_logic;
        signal ID_Branch    : std_logic;
        signal ID_JRControl : std_logic;
        
        -- Execution phase
        signal Ex_RegDst    : std_logic;
        signal Ex_ALUSrc    : std_logic;
        signal Ex_MemtoReg  : std_logic;
        signal Ex_RegWrite  : std_logic;
        signal Ex_MemRead   : std_logic;
        signal Ex_MemWrite  : std_logic;
        signal Ex_Branch    : std_logic;
        signal Ex_JRControl : std_logic;

        -- Memory phase
        signal Mem_MemtoReg : std_logic;
        signal Mem_RegWrite : std_logic;
        signal Mem_MemRead  : std_logic;
        signal Mem_MemWrite : std_logic;
        
        -- Write back phase
        signal WB_MemtoReg : std_logic;
        signal WB_RegWrite : std_logic;
         
        signal ALUOp            : std_logic_vector(1 downto 0);
        signal ID_ALUOp         : std_logic_vector(1 downto 0);
        signal Ex_ALUOp         : std_logic_vector(1 downto 0);
        signal ALUControl       : std_logic_vector(1 downto 0);
        signal bneControl       : std_logic;
        signal notbneControl    : std_logic;
        signal jumpControl      : std_logic;
        signal jumpFlush        : std_logic;
        
        signal ForwardA         : std_logic_vector(1 downto 0);
        signal ForwardB         : std_logic_vector(1 downto 0);
        
        signal ID_Flush         : std_logic;
        signal IF_Flush         : std_logic;
        signal IFID_Flush       : std_logic;
        signal notIFID_Flush    : std_logic;
        signal stall_Flush      : std_logic;
        signal flush            : std_logic;
        
        signal shiftLeft2_bne_out       : std_logic_vector(31 downto 0);
        signal shiftLeft2_jump_out      : std_logic_vector(31 downto 0);

        signal PC_WriteEn   : std_logic := '1';
        signal IFID_WriteEn : std_logic;
        
        signal temp         : std_logic_vector(31 downto 0);
        
        
        -- PC register
        component register_32bit is
          Port (
            regOut  :   inout std_logic_vector(31 downto 0);
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
          Port ( addr : in std_logic_vector( 31 downto 0 );
                 data : out std_logic_vector( 31 downto 0 ) 
          );
        end component instruction_memory;
        
        component reg_bit is
          Port ( 
                bitOut  :   inout std_logic;
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
        
        component register_file is
          Port (
                readRegister1 : in  std_logic_vector(4 downto 0);
                readRegister2 : in  std_logic_vector(4 downto 0);
                writeRegister : in  std_logic_vector(4 downto 0);
                writeData     : in  std_logic_vector(31 downto 0);
                regWrite      : in  std_logic;
                reset         : in  std_logic;
                clk           : in  std_logic;
                readData1     : out std_logic_vector(31 downto 0);
                readData2     : out std_logic_vector(31 downto 0)
           );
        end component register_file;
        
        component WB_forward_unit is
          Port ( 
                readData1Out    : out std_logic_vector(31 downto 0);
                readData2Out    : out std_logic_vector(31 downto 0);
                readData1       : in  std_logic_vector(31 downto 0);
                readData2       : in  std_logic_vector(31 downto 0);
                writeData       : in  std_logic_vector(31 downto 0);
                rs              : in  std_logic_vector(4 downto 0);
                rt              : in  std_logic_vector(4 downto 0);
                writeRegister   : in  std_logic_vector(4 downto 0);
                regWrite        : in  std_logic
          );
        end component WB_forward_unit;
        
        component Sign_extend is
          Port ( 
            A : in std_logic_vector (15 downto 0);
            Output : out std_logic_vector (31 downto 0)
          );
        end component Sign_extend;
        
        component zero_extension is
          Port ( 
                z_in  : in std_logic_vector(15 downto 0);
                z_out : out std_logic_vector(31 downto 0)
           );
        end component zero_extension;
        
        component mux2x32to32 is
        Port ( 
                A : in std_logic_vector (31 downto 0);
                B : in std_logic_vector (31 downto 0);
                Sel : in std_logic;
                Output : out std_logic_vector (31 downto 0)
              );
        end component mux2x32to32;
        
        component Discard_Inst is
          Port (
            Jmp : in std_logic;
            BNE : in std_logic;
            JR : in std_logic;
            Id_Flush : out std_logic;
            If_Flush : out std_logic
           );
        end component Discard_Inst;
        
        component FlushControl_unit is
          Port (
            flush : in std_logic;
            Reg_dst : in std_logic;
            ALU_src : in std_logic;
            Mem_to_reg : in std_logic;
            Reg_write : in std_logic;
            Mem_read : in std_logic;
            Mem_write : in std_logic;
            Branch : in std_logic;
            JR_control : in std_logic;
                
            ALUop : in std_logic_vector (1 downto 0);
            
            Id_reg_dst : out std_logic;
            Id_alu_src : out std_logic;
            Id_memToreg : out std_logic;
            Id_regWrite : out std_logic;
            Id_mem_Read : out std_logic;
            Id_mem_Write : out std_logic;
            Id_branch : out std_logic;
            Id_JR_control : out std_logic;
            
            Id_ALUop : out std_logic_vector (1 downto 0)
           );
        end component FlushControl_unit;
        
        component forwarding_unit is
            Port (
                    forwardA    : out std_logic_vector(1 downto 0);
                    forwardB    : out std_logic_vector(1 downto 0);
                    mem_regWrite: in  std_logic;
                    WB_regWrite : in  std_logic;
                    mem_writeReg: in  std_logic_vector(4 downto 0);
                    WB_writeReg : in  std_logic_vector(4 downto 0);
                    Ex_rs       : in  std_logic_vector(4 downto 0);
                    Ex_rt       : in  std_logic_vector(4 downto 0)
            );
        end component forwarding_unit;
        
        component Forwarding_MUX is
          Port ( 
            A : in std_logic_vector (31 downto 0);
            B : in std_logic_vector (31 downto 0);
            C : in std_logic_vector (31 downto 0);
            Sel : in std_logic_vector (1 downto 0);
            Data_Out : out std_logic_vector (31 downto 0)
          );
        end component Forwarding_MUX;
        
        component ALU_control_Unit is
          Port ( 
            AluOP : in std_logic_vector (1 downto 0);
            Func : in std_logic_vector (5 downto 0);
            ALU_c : out std_logic_vector (1 downto 0) register := "00"
          );
        end  component ALU_control_Unit;
        
        component ALU_32bit is
          Port ( 
            A : in std_logic_vector(31 downto 0);
            B : in std_logic_vector(31 downto 0);
            ALU_C : in std_logic_vector(1 downto 0);
            c_out : out std_logic;
            overflow : inout std_logic;
            negative : out std_logic;
            zero : out std_logic;
            output : inout std_logic_vector(31 downto 0)
          );
        end component ALU_32bit;
        
        component data_memory is
            Port ( 
                addr        : in    std_logic_vector( 31 downto 0 );
                writeData   : in    std_logic_vector( 31 downto 0 );
                data        : out   std_logic_vector( 31 downto 0 );
                writeEnable : in    std_logic;
        --        memRead     : in    std_logic;
                clk         : in    std_logic
            );
            
        end component data_memory;
        
        component StallControl_Unit is
          Port ( 
            Ex_Mem_R : in std_logic;
            Ex_rt : in std_logic_vector (4 downto 0);
            Id_rs : in std_logic_vector (4 downto 0);
            Id_rt : in std_logic_vector (4 downto 0);
            Id_op : in std_logic_vector (5 downto 0);
            Pc_write_enable : out std_logic;
            IfId_write_enable : out std_logic;
            stall_flush : out std_logic
            
          );
        end component StallControl_Unit;
        
        component Shift_Left2 is
          Port ( 
            A: in std_logic_vector (31 downto 0);
            Output : out std_logic_vector (31 downto 0)
          );
        end component Shift_Left2;
        
        
        component JR_control_unit is
          Port (
            AluOP : in std_logic_vector (1 downto 0);
            Func : in std_logic_vector (5 downto 0);
            JR_control : out std_logic
           );
           
        end component JR_control_unit;
        
        component mux_2x5to5 is
          Port ( 
            Addr_0 : in std_logic_vector (4 downto 0);
            Addr_1 : in std_logic_vector (4 downto 0);
            Sel : in std_logic;
            Addr_out : out std_logic_vector (4 downto 0)
          );
        end component mux_2x5to5;

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
     
     opCode             <= ID_instruction(31 downto 26);
     functionPointer    <= ID_instruction(5 downto 0);
     rs                 <= ID_instruction(25 downto 21);
     rt                 <= ID_instruction(20 downto 16);
     rd                 <= ID_instruction(15 downto 11);
     imm16              <= ID_instruction(15 downto 0);

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
     
     regFile   :  register_file port map(
               readRegister1 => rs,
               readRegister2 => rt,
               writeRegister => WB_WriteRegister,
               writeData   => WB_writeData,
               regWrite    => WB_regWrite,
               reset       => reset,
               clk         => clk,
               readData1   => readData1,
               readData2   => readData2
           );
      
     -- forwarding read data if write and read at the same time
     forward_unit : WB_forward_unit port map(
               readData1Out => readData1Out,
               readData2Out => readData2Out,
               readData1   => readData1,
               readData2   => readData2,
               writeData   => WB_writeData,
               rs          => rs,
               rt          => rt,
               writeRegister => WB_writeRegister,
               regWrite      => WB_regWrite
               );
      
     -- sign extend
     signextend :   Sign_extend port map( 
                 A          => imm16,
                 Output     => sign_ext_out
               );
    
    -- zero extend
    zeroextend : zero_extension port map ( 
                    z_in  => imm16,
                    z_out => zero_ext_out
               );
      
    -- immediate extend : sign or zero         
    muxSignORZero   :  mux2x32to32 port map ( 
               A => sign_ext_out,
               B => zero_ext_out,
               Sel => signZero,
               Output => Im16_Ext
             );
    
    
    JR_cntrol:JR_control_unit port map (
             AluOP => ALUop,
             Func => functionpointer,
             JR_control => JRControl
         );
    
    discardInstructionBlock : Discard_Inst Port map (
             Jmp => JumpControl,
             BNE => bneControl,
             JR => Ex_JRControl,
             Id_Flush => ID_Flush,
             If_Flush => IF_Flush
            );
    
    flush   <= ID_flush or IFID_Flush or stall_flush;
    
    Flush_unit: FlushControl_unit port map (
            flush => flush,
            Reg_dst => RegDst,
            ALU_src => ALUSrc,
            Mem_to_reg => MemtoReg,
            Reg_write => Regwrite,
            Mem_read => Memread,
            Mem_write => Memwrite,
            Branch => Branch,
            JR_control => JRControl,
            ALUop => ALUop,
            
            Id_reg_dst => ID_RegDst,
            Id_alu_src => ID_ALUSrc,
            Id_memToreg => ID_MemtoReg,
            Id_regWrite => ID_Regwrite,
            Id_mem_Read => ID_Memread,
            Id_mem_Write => ID_Memwrite,
            Id_branch => ID_Branch,
            Id_JR_control => ID_JRControl,
            Id_ALUop => Id_ALUop
        );
        
        
    -- Ex stage
    IDEx_PC4 : register_32bit port map(
            regOut => EX_PC4,
            regData => ID_PC4,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
    
    IDEx_ReadData1 : register_32bit port map(
            regOut => exReadData1,
            regData => readData1Out,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
        
    IDEx_ReadData2 : register_32bit port map(
            regOut => exReadData2,
            regData => readData2Out,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
    
    IDEx_Im16_ext : register_32bit port map(
            regOut => Ex_im16_ext,
            regData => im16_ext,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
        
    IDEx_rs_rt_rd: register_32bit port map(
            regOut => ex_instruction(31 downto 0),
            regData => ID_instruction,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
    
    ex_rs <= ex_instruction(25 downto 21);
    ex_rt <= ex_instruction(20 downto 16);
    ex_rd <= ex_instruction(15 downto 11); 
    
    
    -- 9 control signals via ID/Ex
    IDEX_RegDst   : reg_bit port map( 
          bitOut  =>   Ex_regDst,
          bitData =>  ID_RegDst,
          writeEn =>   '1',
          reset   =>   reset,
          clk     =>  clk
    );
    
    IDEX_ALUSrc  : reg_bit port map( 
           bitOut  =>   Ex_ALUSrc,
           bitData =>  ID_ALUSrc,
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
      );
    IDEX_MemtoReg   : reg_bit port map( 
           bitOut  =>   Ex_MemtoReg,
           bitData =>  ID_MemtoReg,
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
     ); 
    IDEX_RegWrite  : reg_bit port map( 
           bitOut  =>   Ex_regWrite,
           bitData =>  ID_regWrite,
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
     );
     
     IDEX_Memread  : reg_bit port map( 
            bitOut  =>   Ex_Memread,
            bitData =>  ID_Memread,
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
       );
     IDEX_MemWrite  : reg_bit port map( 
            bitOut  =>   Ex_Memwrite,
            bitData =>  ID_Memwrite,
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );   
    IDEX_Branch   : reg_bit port map( 
            bitOut  =>   Ex_branch,
            bitData =>  ID_branch,
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );
      
      IDEX_JRControl : reg_bit port map( 
             bitOut  =>   Ex_JRControl,
             bitData =>  ID_JRControl,
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
        );
        
      IDEX_ALUOp1   : reg_bit port map( 
             bitOut  =>   Ex_ALUOp(1),
             bitData =>  ID_ALUOp(1),
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
       );  
       
      IDEX_ALUOp2   : reg_bit port map( 
              bitOut  =>   Ex_ALUOp(0),
              bitData =>  ID_ALUOp(0),
              writeEn =>   '1',
              reset   =>   reset,
              clk     =>  clk
        );    
        
      forwardingUnit : forwarding_unit port map(
            forwardA        => forwardA,
            forwardB        => forwardB,
            mem_regWrite    => mem_regWrite, 
            WB_regWrite     => WB_regWrite,
            mem_writeReg    => mem_writeRegister,
            WB_writeReg     => WB_writeRegister,
            Ex_rs           => Ex_rs,
            Ex_rt           => Ex_rt
        );
      
      -- mux 3 x32 to 32 to choose source of ALU (forwarding)
      mux3A : Forwarding_MUX port map ( 
            A => exReadData1,
            B => MEM_ALUResult,
            C => WB_WriteData,
            Sel => forwardA,
            Data_Out => Bus_A_ALU
          );
          
     mux3B : Forwarding_MUX port map ( 
          A => exReadData2,
          B => MEM_ALUResult,
          C => WB_WriteData,
          Sel => forwardB,
          Data_Out => Bus_B_forwarded
        ); 
        
     -- mux 2x32 to 32 to select source Bus B of ALU
     muxALUSrc   :  mux2x32to32 port map ( 
        A => Bus_B_Forwarded,
        B => EX_Im16_Ext,
        Sel =>  Ex_alusrc,
        Output => Bus_B_ALU
      );  
      
    ALUcontrolblock : ALU_control_Unit Port map ( 
          AluOP => Ex_ALUOp,
          Func => Ex_Im16_Ext(5 downto 0),
          ALU_c => ALUControl
        );
              
    ALU32:ALU_32bit port map (
        A => Bus_A_ALU,
        B => Bus_B_ALU,
        ALU_C => ALUControl,
        c_out => Carryflag,
        overflow => overflowflag,
        negative => negativeflag,
        zero => ZeroFlag,
        output => EX_ALUResult
    );   
    
    
    -- Mux2x5to5     
    muxRegDst : mux_2x5to5 Port map( 
        Addr_0      => EX_rt,
        Addr_1      => EX_rd,
        Sel         => EX_RegDst,
        Addr_out    => EX_WriteRegister
      );
    
    
    
    -- Mem State
     EXMEM_ALUResult: register_32bit port map(
            regOut => MEM_ALUResult,
            regData => EX_ALUResult,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );
    
    EXMEM_WriteDataOfMem: register_32bit port map(
            regOut => writeDataofMem,
            regData => Bus_B_forwarded,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    );  
    
    EXMEM_MemtoReg   : reg_bit port map( 
           bitOut  =>   MEM_MemtoReg,
           bitData =>  EX_MemtoReg,
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
     ); 
    EXMEM_RegWrite  : reg_bit port map( 
           bitOut  =>   MEM_regWrite,
           bitData =>  Ex_regWrite,
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
     );
         
     EXMEM_Memread  : reg_bit port map( 
            bitOut  =>   MEM_Memread,
            bitData =>  Ex_Memread,
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
       );
     EXMEM_MemWrite  : reg_bit port map( 
            bitOut  =>   MEM_Memwrite,
            bitData =>  EX_Memwrite,
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );  
     EXMEM_WriteRegister4  : reg_bit port map( 
             bitOut  =>   MEM_WriteRegister(4),
             bitData =>  EX_WriteRegister(4),
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
       );  
     EXMEM_WriteRegister3 : reg_bit port map( 
              bitOut  =>   MEM_WriteRegister(3),
              bitData =>  EX_WriteRegister(3),
              writeEn =>   '1',
              reset   =>   reset,
              clk     =>  clk
        );   
     EXMEM_WriteRegister2  : reg_bit port map( 
                bitOut  =>   MEM_WriteRegister(2),
                bitData =>  EX_WriteRegister(2),
                writeEn =>   '1',
                reset   =>   reset,
                clk     =>  clk
          );  
    EXMEM_WriteRegister1  : reg_bit port map( 
             bitOut  =>   MEM_WriteRegister(1),
             bitData =>   EX_WriteRegister(1),
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
       );   
   EXMEM_WriteRegister0 : reg_bit port map( 
            bitOut  =>   MEM_WriteRegister(0),
            bitData =>   EX_WriteRegister(0),
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );  
      
   -- Data memory
   dataMem: data_memory
       port map(
                addr => Mem_ALUResult ,
                writeData => WriteDataofMem,
                data => MEM_ReadDataOfMem,
                writeEnable => MEM_MemWrite,
                clk => clk
    );
    
    MEMWB_ReadDataOfMem: register_32bit port map(
            regOut => WB_ReadDataofMem,
            regData => MEM_ReadDataofMem,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    ); 
    
    MEMWB_ALUResult: register_32bit port map(
            regOut => WB_ALUResult,
            regData => MEM_ALUResult,
            writeEn => '1',
            reset   => reset,
            clk     => clk
    ); 
     MEMWB_WriteRegister4  : reg_bit port map( 
            bitOut  =>   WB_WriteRegister(4),
            bitData =>  MEM_WriteRegister(4),
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );  
    MEMWB_WriteRegister3 : reg_bit port map( 
             bitOut  =>   WB_WriteRegister(3),
             bitData =>  MEM_WriteRegister(3),
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
       );   
    MEMWB_WriteRegister2  : reg_bit port map( 
               bitOut  =>   WB_WriteRegister(2),
               bitData =>  MEM_WriteRegister(2),
               writeEn =>   '1',
               reset   =>   reset,
               clk     =>  clk
         );  
   MEMWB_WriteRegister1  : reg_bit port map( 
            bitOut  =>   WB_WriteRegister(1),
            bitData =>   MEM_WriteRegister(1),
            writeEn =>   '1',
            reset   =>   reset,
            clk     =>  clk
      );   
   MEMWB_WriteRegister0 : reg_bit port map( 
           bitOut  =>   WB_WriteRegister(0),
           bitData =>   MEM_WriteRegister(0),
           writeEn =>   '1',
           reset   =>   reset,
           clk     =>  clk
     );
    
    MEMWB_MemtoReg  : reg_bit port map( 
              bitOut  =>   WB_MemtoReg,
              bitData =>   MEM_MemtoReg,
              writeEn =>   '1',
              reset   =>   reset,
              clk     =>  clk
        ); 
          
     MEMWB_RegWrite : reg_bit port map( 
             bitOut  =>   WB_RegWrite ,
             bitData =>   MEM_RegWrite,
             writeEn =>   '1',
             reset   =>   reset,
             clk     =>  clk
       );    
     
     muxMEMtoReg   :  mux2x32to32 port map ( 
          A => WB_ALUResult,
          B => WB_ReadDataOfMem,
          Sel =>  WB_MemtoReg,
          Output => WB_WriteData
        );    
              
    Stall_cntrl: StallControl_Unit port map (
            Ex_Mem_R => Ex_Memread,
            Ex_rt => Ex_rt,
            Id_rs => rs,
            Id_rt => rt,
            Id_op => opcode,
            Pc_write_enable => PC_WriteEn,
            IfId_write_enable => IFID_writeEn,
            stall_flush => stall_flush
        );
        
   -- Jump,bne, JRs
   -- bne: Branch if not equal
   SHIFT_L:Shift_Left2 port map (
        A => EX_Im16_Ext,
        Output => shiftleft2_bne_out
    );
    
    Add_bne : adder_32bit port map(
            A   => EX_PC4,
            B   => shiftleft2_bne_out,
            S   => PCbne
            
    );
    
    notZeroFlag <= not(ZeroFlag);
    bneControl <= EX_Branch and notZeroFlag;
    
    muxbneControl :  mux2x32to32 port map ( 
          A => PC4,
          B => PCbne,
          Sel =>  bneControl,
          Output => PC4bne
        ); 
       
   temp <=   "000000" & ID_instruction(25 downto 0);
   
   shiftleft2_jump  :   Shift_Left2 port map (
            A => temp,
            Output => shiftleft2_jump_out
     ); 
     
     
   PCj <= ID_PC4(31 downto 28) & shiftleft2_jump_out(27 downto 0);
   
   notIFID_flush <= not(IFID_Flush);
   JumpFlush <= Jump and notIFID_flush;
   
   notbneControl <= not(bneControl);
   
   JumpControl <= JumpFlush and notbneControl;
   
   muxJump :  mux2x32to32 port map ( 
         A => PC4bne,
         B => PCj,
         Sel =>  JumpControl,
         Output => PC4bnej
       ); 
   
   PCjr <= Bus_A_ALU;
   
   muxJR :  mux2x32to32 port map ( 
        A => PC4bnej,
        B => PCjr,
        Sel =>  EX_JRControl,
        Output => PCin
      ); 
      
      -- Outputing internal commands
    PC_output               <= PC;
    opCode_output           <= opCode;
    Bus_A_ALU_output        <= Bus_A_ALU;
    Bus_B_ALU_output        <= Bus_B_ALU;
    instruction_output      <= instruction; 
    functionPointer_output  <= functionPointer;
    rs_output               <= rs;
    rt_output               <= rt;
    rd_output               <= rd;
    readData1_output        <= readData1;
    readData2_output        <= readData2;
    readData1Out_output     <= readData1Out;
    readData2Out_output     <= readData2Out;   
    regDst_output           <= regDst;
    ALUSrc_output           <= ALUSrc;
    MemToReg_output         <= MemToReg;
    RegWrite_output         <= RegWrite;
    memRead_output          <= memRead;
    memWrite_output         <= memWrite;
    branch_output           <= branch;
    Jump_output             <= Jump;
    signZero_output         <= signZero;
    JRControl_output        <= JRControl;
    ForwardA_output         <= ForwardA;
    ForwardB_output         <= ForwardB; 
    flush_output            <= flush;
   
 
end Behavioral;
