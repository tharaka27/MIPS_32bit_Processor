----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 01:44:04 PM
-- Design Name: 
-- Module Name: Flush_unit_TB - Behavioral
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

entity Flush_unit_TB is
--  Port ( );
end Flush_unit_TB;

architecture Behavioral of Flush_unit_TB is

    signal flush : std_logic;
    signal Reg_dst : std_logic;
    signal ALU_src : std_logic;
    signal Mem_to_reg : std_logic;
    signal Reg_write : std_logic;
    signal Mem_read : std_logic;
    signal Mem_write : std_logic;
    signal Branch : std_logic;
    signal JR_control : std_logic;
        
    signal ALUop : std_logic_vector (1 downto 0);
    
    signal Id_reg_dst : std_logic;
    signal Id_alu_src : std_logic;
    signal Id_memToreg : std_logic;
    signal Id_regWrite : std_logic;
    signal Id_mem_Read : std_logic;
    signal Id_mem_Write : std_logic;
    signal Id_branch : std_logic;
    signal Id_JR_control : std_logic;
    
    signal Id_ALUop : std_logic_vector (1 downto 0);
    
    component FlushControl_unit
        port(
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
    end component;
    
begin

    Flush_unit: FlushControl_unit port map (
        flush => flush,
        Reg_dst => Reg_dst,
        ALU_src => ALU_src,
        Mem_to_reg => Mem_to_reg,
        Reg_write => Reg_write,
        Mem_read => Mem_read,
        Mem_write => Mem_write,
        Branch => Branch,
        JR_control => JR_control,
            
        ALUop => ALUop,
        
        Id_reg_dst => Id_reg_dst,
        Id_alu_src => Id_alu_src,
        Id_memToreg => Id_memToreg,
        Id_regWrite => Id_regWrite,
        Id_mem_Read => Id_mem_Read,
        Id_mem_Write => Id_mem_Write,
        Id_branch => Id_branch,
        Id_JR_control => Id_JR_control,
        
        Id_ALUop => Id_ALUop
    );
    
    TB : process 
    begin 
        flush <= '0';
        Reg_dst <= '1';
        ALU_src <= '1';
        Mem_to_reg <= '1';
        Reg_write <= '1';
        Mem_read <= '1';
        Mem_write <= '1';
        Branch <= '1';
        JR_control <= '1';
            
        ALUop <= "10";
        
        wait for 5ns;
        
        flush <= '1';
        Reg_dst <= '1';
        ALU_src <= '1';
        Mem_to_reg <= '1';
        Reg_write <= '1';
        Mem_read <= '1';
        Mem_write <= '1';
        Branch <= '1';
        JR_control <= '1';
            
        ALUop <= "10";
        
        wait for 5ns;
        
        flush <= '0';
        Reg_dst <= '1';
        ALU_src <= '1';
        Mem_to_reg <= '1';
        Reg_write <= '1';
        Mem_read <= '1';
        Mem_write <= '1';
        Branch <= '1';
        JR_control <= '1';
            
        ALUop <= "11";
        
        wait for 5ns;
        
        flush <= '1';
        Reg_dst <= '1';
        ALU_src <= '1';
        Mem_to_reg <= '1';
        Reg_write <= '1';
        Mem_read <= '1';
        Mem_write <= '1';
        Branch <= '1';
        JR_control <= '1';
            
        ALUop <= "11";
        
        wait for 5ns;
        
        wait;
        
    
    end process;

end Behavioral;
