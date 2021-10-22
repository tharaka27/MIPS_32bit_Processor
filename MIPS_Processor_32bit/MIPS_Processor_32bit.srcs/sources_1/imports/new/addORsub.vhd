----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2021 08:24:48 PM
-- Design Name: 
-- Module Name: addORsub - Behavioral
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

entity addORsub is
  Port ( 
    A : in std_logic;
    B : in std_logic;
    c_in : in std_logic;
    sel : in std_logic;
    output : out std_logic;
    c_out : out std_logic
  );
end addORsub;

architecture Behavioral of addORsub is
    
    signal mux_result : std_logic;
    signal not_b : std_logic;
    
    component mux_2to1
        port(
        a : in std_logic;
        b : in std_logic;
        sel : in std_logic;
        output : out std_logic
    );
    end component;
    
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
    
    not_b <= not B;
    
    MUX0:mux_2to1 port map (
        a => B,
        b => not_b,
        sel => sel,
        output => mux_result
    );
    
    A0:adder port map(
        a => A,
        b => mux_result,
        c_in => c_in,
        s => output,
        c_out => c_out
    );

end Behavioral;
