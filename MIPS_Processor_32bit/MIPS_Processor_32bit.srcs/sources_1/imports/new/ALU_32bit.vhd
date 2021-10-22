----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2021 11:59:23 PM
-- Design Name: 
-- Module Name: ALU_32bit - Behavioral
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

entity ALU_32bit is
  Port ( 
    A : in std_logic_vector(31 downto 0);
    B : in std_logic_vector(31 downto 0);
    ALU_C : in std_logic_vector(1 downto 0);
    c_out : out std_logic;
    overflow : inout std_logic;
    negative : out std_logic;
    zero : out std_logic;
    output : inout std_logic_vector(31 downto 0)
  );
end ALU_32bit;

architecture Behavioral of ALU_32bit is

    signal lessthan : std_logic;
    signal carry_out : std_logic_vector(31 downto 0);
    signal not_carry : std_logic;
    signal carry_out31 : std_logic;
    signal addsub_31 : std_logic;
    
    signal out1 : std_logic;
    signal out2 : std_logic;
    signal out3 : std_logic;
    signal out4 : std_logic;
    signal out5 : std_logic;
    signal out6 : std_logic;
    signal out7 : std_logic;
    signal out8 : std_logic;
    signal out9 : std_logic;
    signal out10 : std_logic;
    
    component alu_1bit
        port(
            a : in std_logic;
            b : in std_logic;
            c_in : in std_logic;
            less : in std_logic;
            ALU_control : std_logic_vector(1 downto 0);
            result : out std_logic;
            c_out : out std_logic
        );
    end component;
    
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

    ALU0:alu_1bit port map (
        a => A(0),
        b => B(0),
        c_in => ALU_c(1),
        less => lessthan,
        ALU_control => ALU_C,
        result => output(0),
        c_out => carry_out(0)
    );
    
    G_1: for i in 1 to 31 generate
        ALU0:alu_1bit port map (
            a => A(i),
            b => B(i),
            c_in => carry_out(i-1),
            less => '0',
            ALU_control => ALU_C,
            result => output(i),
            c_out => carry_out(i)
        );
    end generate;
    
    not_carry <= not carry_out(31);
    
    MUX0:mux_2to1 port map (
            a => carry_out(31),
            b => not_carry,
            sel => ALU_C(1),
            output => c_out
        );
        
    overflow <= carry_out(30) xor carry_out(31);
    
    AS0:addORsub port map (
        a => A(31),
        b => B(31),
        c_in => carry_out(30),
        sel => ALU_C(1),
        output => addsub_31,
        c_out => carry_out31           
    );
    
    lessthan <= overflow xor addsub_31;
    negative <= output(31);
    
    out1 <= output(0) or output(1) or output(2) or output(3);
    out2 <= output(4) or output(5) or output(6) or output(7);
    out3 <= output(8) or output(9) or output(10) or output(11);
    out4 <= output(12) or output(13) or output(14) or output(15);
    out5 <= output(16) or output(17) or output(18) or output(19);
    out6 <= output(20) or output(21) or output(22) or output(23);
    out7 <= output(24) or output(25) or output(26) or output(27);
    out8 <= output(28) or output(29) or output(30) or output(31);
    out9 <= out1 or out2 or out3 or out4;
    out10 <= out5 or out6 or out7 or out8;
    
    zero <= out9 nor out10;
    
    

end Behavioral;
