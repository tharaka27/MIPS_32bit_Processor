----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2021 03:34:06 PM
-- Design Name: 
-- Module Name: adder_32bit - Behavioral
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

entity adder_32bit is
  Port (
    A : in std_logic_vector (31 downto 0);
    B : in std_logic_vector (31 downto 0) ;
    S : out std_logic_vector (31 downto 0);
    C_out : out std_logic
   );
end adder_32bit;

architecture Behavioral of adder_32bit is

    signal c : std_logic_vector (1 to 31);
    
    component adder
        port(
            a : in std_logic;
            b : in std_logic;
            c_in : in std_logic;
            s : out std_logic;
            c_out : out std_logic
        );
    end component;
begin

    A0:adder port map (
        a => A(0),
        b => B(0),
        c_in => '0',
        s => S(0),
        c_out => c(1)
    );
    
    G_1: for i in 1 to 30 generate
        Ai:adder port map (
            a => A(i),
            b => B(i),
            c_in => c(i),
            s => S(i),
            c_out => c(i+1)
        );
    end generate;
    
    A31:adder port map (
        a => A(31),
        b => B(31),
        c_in => c(31),
        s => S(31),
        c_out => C_out
    );
end Behavioral;
