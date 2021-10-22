----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 12:29:16 AM
-- Design Name: 
-- Module Name: FlushControl_unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FlushControl_unit is
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
end FlushControl_unit;

architecture Behavioral of FlushControl_unit is

    signal notFlush : std_logic;
    
begin

    notFlush <= not flush;
    Id_reg_dst <= Reg_dst and notFlush;
    Id_alu_src <= ALU_src and notFlush;
    Id_memToreg <= Mem_to_reg and notFlush;
    Id_regWrite <= Reg_write and notFlush;
    Id_mem_Read <= Mem_read and notFlush;
    Id_mem_Write <= Mem_Write and notFlush;
    Id_branch <= Branch and notFlush;
    Id_JR_control <= JR_control and notFlush;
    Id_ALUop(1) <= ALUop(1) and notFlush;
    Id_ALUop(0) <= ALUop(0) and notFlush;

end Behavioral;
