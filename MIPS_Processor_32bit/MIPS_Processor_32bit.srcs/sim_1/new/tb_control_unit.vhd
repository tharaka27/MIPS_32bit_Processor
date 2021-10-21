--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_unit is
--  Port ( );
end tb_control_unit;

architecture Behavioral of tb_control_unit is
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
    
            signal regDst          : std_logic;
            signal ALUSrc          : std_logic;
            signal memToReg        : std_logic;
            signal regWrite        : std_logic;
            signal memRead         : std_logic;
            signal memWrite        : std_logic;
            signal branch          : std_logic;
            signal jump            : std_logic;
            signal signZero        : std_logic;
            signal ALUOp           : std_logic_vector(1 downto 0);
            signal opCode          : std_logic_vector(5 downto 0);

begin

UUT : control_unit port map(
        regDst      => regDst,
        ALUSrc      => ALUSrc,
        memToReg    => memToReg,
        regWrite    => regWrite,
        memRead     => memRead,
        memWrite    => memWrite,
        branch      => branch,
        jump        => jump,
        signZero    => signZero,
        ALUOp       => ALUOp,
        opCode      => opCode
);


stimuli: process
begin
        opCode <= "000000";
        wait for 10ns;
        
        opCode <= "100011";
        wait for 10ns;
        
        opCode <= "101011";
        wait for 10ns;
        
        opCode <= "000101";
        wait for 10ns;
        
        opCode <= "001110";
        wait for 10ns;
        
        opCode <= "000010";
        wait for 10ns;
        
        opCode <= "000011";
        wait for 10ns;
        
        wait;
end process stimuli;
end Behavioral;
