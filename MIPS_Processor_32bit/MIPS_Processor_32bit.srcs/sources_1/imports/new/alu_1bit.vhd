----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2021 08:47:47 PM
-- Design Name: 
-- Module Name: alu_1bit - Behavioral
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

entity alu_1bit is
  Port (
    A : in std_logic;
    B : in std_logic;
    c_in : in std_logic;
    less : in std_logic;
    ALU_control : std_logic_vector(1 downto 0);
    result : out std_logic;
    c_out : out std_logic
   );
end alu_1bit;

architecture Behavioral of alu_1bit is
   
   signal AB_xor : std_logic;
   signal addsub_out : std_logic;
   signal xor_lessOut : std_logic;
   
   component addORsub
        port(
        a : in std_logic;
        b : in std_logic;
        c_in : in std_logic;
        sel : in std_logic;
        output : out std_logic;
        c_out : out std_logic
    );
    end component;  
    
    component mux_2to1
        port(
        a : in std_logic;
        b : in std_logic;
        sel : in std_logic;
        output : out std_logic
    );
    end component; 
     
begin
    
    AB_xor <= A xor B;
    
    AS0:addORsub port map (
        a => A,
        b => B,
        c_in => c_in,
        sel => ALU_control(1),
        output => addsub_out ,
        c_out => c_out           
    );
    
    MUX0:mux_2to1 port map (
        a => AB_xor,
        b => less,
        sel => ALU_control(1),
        output => xor_lessOut
    );
    
    MUX1:mux_2to1 port map (
        a => addsub_out,
        b => xor_lessOut,
        sel => ALU_control(0),
        output => result
    );

end Behavioral;
