----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2021 01:17:03 PM
-- Design Name: 
-- Module Name: tb_decorder - Behavioral
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

entity tb_decorder is
--  Port ( );
end tb_decorder;

architecture Behavioral of tb_decorder is

    component decorder is
      Port (
               writeRegister    :   in  std_logic_vector(4 downto 0);
               writeEnable      :   out std_logic_vector(31 downto 0);
               regWrite         :   in  std_logic
       );
    end component decorder;

    signal writeRegister    :   std_logic_vector(4 downto 0);
    signal writeEnable      :   std_logic_vector(31 downto 0);
    signal regWrite         :   std_logic;

begin

UUT : decorder port map(
    writeRegister   => writeRegister,
    writeEnable     => writeEnable,
    regWrite        => regWrite
);

stimuli: process
begin
    writeRegister <= "00000";
    regWrite      <= '1';
    wait for 10ns;
    
    writeRegister <= "00000";
    regWrite      <= '0';
    wait for 10ns;
    
    writeRegister <= "10000";
    regWrite      <= '1';
    wait for 10ns;
    
    writeRegister <= "11111";
    regWrite      <= '1';
    wait for 10ns;
    
    writeRegister <= "10001";
    regWrite      <= '1';
    wait for 10ns;   
    wait;
    
end process;
end Behavioral;
