--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_unit is
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
end control_unit;

architecture Behavioral of control_unit is

begin

process(opCode)
begin
    case opCode is
      when "000000"     =>   -- R type
            regDst      <= '1';
            ALUSrc      <= '0';
            memToReg    <= '0';
            regWrite    <= '1';
            memRead     <= '0';
            memWrite    <= '0';
            branch      <= '0';
            jump        <= '0';
            signZero    <= '0';
            ALUOp       <= "10";
      when "100011" =>      -- lw - load word
            regDst      <= '0';
            ALUSrc      <= '1';
            memToReg    <= '1';
            regWrite    <= '1';
            memRead     <= '1';
            memWrite    <= '0';
            branch      <= '0';
            jump        <= '0';
            signZero    <= '0';
            ALUOp       <= "00";
      when "101011"  =>     -- sw - store word
            regDst      <= '-';
            ALUSrc      <= '1';
            memToReg    <= '-';
            regWrite    <= '0';
            memRead     <= '0';
            memWrite    <= '1';
            branch      <= '0';
            jump        <= '0';
            signZero    <= '0';
            ALUOp       <= "00";        
      when "000101"  =>     -- bne - branch if not equal
            regDst      <= '0';
            ALUSrc      <= '0';
            memToReg    <= '0';
            regWrite    <= '0';
            memRead     <= '0';
            memWrite    <= '0';
            branch      <= '1';
            jump        <= '0';
            signZero    <= '0';
            ALUOp       <= "01";
      when "001110"  =>     -- XORI - XOR immidiate
            regDst      <= '0';
            ALUSrc      <= '1';
            memToReg    <= '0';
            regWrite    <= '1';
            memRead     <= '0';
            memWrite    <= '0';
            branch      <= '0';
            jump        <= '0';
            signZero    <= '1';
            ALUOp       <= "11";
      when "000010"  =>     -- j - jump
            regDst      <= '0';
            ALUSrc      <= '0';
            memToReg    <= '0';
            regWrite    <= '0';
            memRead     <= '0';
            memWrite    <= '0';
            branch      <= '0';
            jump        <= '1';
            signZero    <= '0';
            ALUOp       <= "00";
      when others =>  
            regDst      <= '0';
            ALUSrc      <= '0';
            memToReg    <= '0';
            regWrite    <= '0';
            memRead     <= '0';
            memWrite    <= '0';
            branch      <= '0';
            jump        <= '0';
            signZero    <= '0';
            ALUOp       <= "10";
    end case;
end process;



end Behavioral;
