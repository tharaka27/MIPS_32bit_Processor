----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2021 12:39:30 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
  Port (
    A : in std_logic;
    B : in std_logic;
    C_in : in std_logic;
    S : out std_logic;
    C_out : out std_logic
  );
end adder;

architecture Behavioral of adder is

begin
    -- sum = A xor B xor carry_in
    S <= A xor B xor C_in;
    -- carry_out = A.B + carry_in.(A+B)
    C_out <= (A and B) or (C_in and (A or B)); 
    
end Behavioral;
