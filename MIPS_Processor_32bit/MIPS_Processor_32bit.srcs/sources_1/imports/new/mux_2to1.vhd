----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2021 08:11:43 PM
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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

entity mux_2to1 is
  Port (
    inA : in std_logic;
    inB : in std_logic;
    sel : in std_logic;
    output : out std_logic
   );
end mux_2to1;

architecture Behavioral of mux_2to1 is

begin
    -- output A when sel = 0 
    -- output B when sel = 1
    output <= (not(sel)and inA) or (sel and inB);

end Behavioral;

