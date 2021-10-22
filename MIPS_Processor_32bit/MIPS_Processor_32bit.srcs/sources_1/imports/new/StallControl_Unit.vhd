----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2021 01:27:58 PM
-- Design Name: 
-- Module Name: StallControl_Unit - Behavioral
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

entity StallControl_Unit is
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
end StallControl_Unit;

architecture Behavioral of StallControl_Unit is
    
    signal XOR_opcode_lw : std_logic_vector (5 downto 0);
    signal XOR_opcode_XORi : std_logic_vector (5 downto 0);
    
    signal XOR_RsRt : std_logic_vector (4 downto 0);
    signal XOR_RtRt : std_logic_vector (4 downto 0);
    
    signal OrRsRt : std_logic;
    signal notOrRsRt : std_logic;
    
    signal OrRtRt : std_logic;
    signal notOrRtRt : std_logic;
    
    signal ec1 : std_logic;
    signal ec2 : std_logic;
    
    signal XORop : std_logic;
    signal XORopRt : std_logic;
    signal ORout : std_logic;
    signal condition : std_logic;
    
begin

    XOR_RsRt(4) <= Ex_rt(4) xor Id_rs(4);
    XOR_RsRt(3) <= Ex_rt(3) xor Id_rs(3);
    XOR_RsRt(2) <= Ex_rt(2) xor Id_rs(2);
    XOR_RsRt(1) <= Ex_rt(1) xor Id_rs(1);
    XOR_RsRt(0) <= Ex_rt(0) xor Id_rs(0);
    OrRsRt <= XOR_RsRt(4) or XOR_RsRt(3) or XOR_RsRt(2) or XOR_RsRt(1) or XOR_RsRt(0);
    notOrRsRt <= not OrRsRt;
    
    XOR_RtRt(4) <= Ex_rt(4) xor Id_rt(4);
    XOR_RtRt(3) <= Ex_rt(3) xor Id_rt(3);
    XOR_RtRt(2) <= Ex_rt(2) xor Id_rt(2);
    XOR_RtRt(1) <= Ex_rt(1) xor Id_rt(1);
    XOR_RtRt(0) <= Ex_rt(0) xor Id_rt(0);
    OrRtRt <= XOR_RtRt(4) or XOR_RtRt(3) or XOR_RtRt(2) or XOR_RtRt(1) or XOR_RtRt(0);
    notOrRtRt <= not OrRtRt;
    
    XOR_opcode_lw(5) <= Id_op(5) xor '1';
    XOR_opcode_lw(4) <= Id_op(4) xor '0';
    XOR_opcode_lw(3) <= Id_op(3) xor '0';
    XOR_opcode_lw(2) <= Id_op(2) xor '0';
    XOR_opcode_lw(1) <= Id_op(1) xor '1';
    XOR_opcode_lw(0) <= Id_op(0) xor '1';
    ec1 <= XOR_opcode_lw(5) or XOR_opcode_lw(4) or XOR_opcode_lw(3) or XOR_opcode_lw(2) or XOR_opcode_lw(1) or XOR_opcode_lw(0);
    
    XOR_opcode_XORi(5) <= Id_op(5) xor '0';
    XOR_opcode_XORi(4) <= Id_op(4) xor '0';
    XOR_opcode_XORi(3) <= Id_op(3) xor '1';
    XOR_opcode_XORi(2) <= Id_op(2) xor '1';
    XOR_opcode_XORi(1) <= Id_op(1) xor '1';
    XOR_opcode_XORi(0) <= Id_op(0) xor '0';
    ec2 <= XOR_opcode_XORi(5) or XOR_opcode_XORi(4) or XOR_opcode_XORi(3) or XOR_opcode_XORi(2) or XOR_opcode_XORi(1) or XOR_opcode_XORi(0);
    
    XORop <= ec1 and ec2;
    XORopRt <= XORop and notOrRtRt;
    ORout <= notOrRsRt or XORopRt;
    condition <= Ex_Mem_R and ORout;
    
    Pc_write_enable <= not condition;
    IfId_write_enable <= not condition;
    stall_flush <= condition;
    
    
end Behavioral;
