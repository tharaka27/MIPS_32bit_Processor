----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 12:56:19 AM
-- Design Name: 
-- Module Name: Discard_Inst - Behavioral
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

entity Discard_Inst is
  Port (
    Jmp : in std_logic;
    BNE : in std_logic;
    JR : in std_logic;
    Id_Flush : out std_logic;
    If_Flush : out std_logic
   );
end Discard_Inst;

architecture Behavioral of Discard_Inst is

begin

    If_Flush <= Jmp or BNE or JR;
    Id_Flush <= BNE or JR;

end Behavioral;
