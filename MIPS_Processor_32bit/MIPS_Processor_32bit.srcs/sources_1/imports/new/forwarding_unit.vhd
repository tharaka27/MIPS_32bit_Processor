--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forwarding_unit is
    Port (
            forwardA    : out std_logic_vector(1 downto 0);
            forwardB    : out std_logic_vector(1 downto 0);
            mem_regWrite: in  std_logic;
            WB_regWrite : in  std_logic;
            mem_writeReg: in  std_logic_vector(4 downto 0);
            WB_writeReg : in  std_logic_vector(4 downto 0);
            Ex_rs       : in  std_logic_vector(4 downto 0);
            Ex_rt       : in  std_logic_vector(4 downto 0)
    );
end forwarding_unit;

architecture Behavioral of forwarding_unit is
        signal  a    : std_logic;
        signal  b    : std_logic;
        signal  d    : std_logic;
        signal  e    : std_logic;
        signal  a1   : std_logic;
        signal  b1   : std_logic;
        signal  d1   : std_logic;
        signal  e1   : std_logic;
        
        signal  x    : std_logic;
        signal  y    : std_logic;
        signal  x1   : std_logic;
        signal  y1   : std_logic;
        

begin

    a  <= mem_writeReg(4) or mem_writeReg(3) or mem_writeReg(2) or mem_writeReg(1) or 
            mem_writeReg(0);
    b  <= (not(mem_writeReg(4) xor Ex_rs(4))) and 
           (not(mem_writeReg(3) xor Ex_rs(3))) and
            (not(mem_writeReg(2) xor Ex_rs(2))) and
             (not(mem_writeReg(1) xor Ex_rs(1))) and
              (not(mem_writeReg(0) xor Ex_rs(0)));
    
    d  <= WB_writeReg(4) or WB_writeReg(3) or WB_writeReg(2) or WB_writeReg(1) or 
            WB_writeReg(0);
    e  <= (not(WB_writeReg(4) xor Ex_rs(4))) and 
           (not(WB_writeReg(3) xor Ex_rs(3))) and
            (not(WB_writeReg(2) xor Ex_rs(2))) and
             (not(WB_writeReg(1) xor Ex_rs(1))) and
              (not(WB_writeReg(0) xor Ex_rs(0)));
                
                
    x  <= a and b and mem_regWrite;
    y  <= d and e and WB_regWrite;
                   
    forwardA <= x & (not(x) and y);

    
    
    -- Forwarding B
    a1  <= mem_writeReg(4) or mem_writeReg(3) or mem_writeReg(2) or mem_writeReg(1) or 
            mem_writeReg(0);
    b1  <=(not(mem_writeReg(4) xor Ex_rt(4))) and 
           (not(mem_writeReg(3) xor Ex_rt(3))) and
            (not(mem_writeReg(2) xor Ex_rt(2))) and
             (not(mem_writeReg(1) xor Ex_rt(1))) and
              (not(mem_writeReg(0) xor Ex_rt(0)));
    
    d1  <= WB_writeReg(4) or WB_writeReg(3) or WB_writeReg(2) or WB_writeReg(1) or 
            WB_writeReg(0);
    e1  <= (not(WB_writeReg(4) xor Ex_rt(4))) and 
               (not(WB_writeReg(3) xor Ex_rt(3))) and
                (not(WB_writeReg(2) xor Ex_rt(2))) and
                 (not(WB_writeReg(1) xor Ex_rt(1))) and
                  (not(WB_writeReg(0) xor Ex_rt(0)));
                
                    
     
    x1   <= a1 and b1 and mem_regWrite;
    y1   <= d1 and e1 and WB_regWrite;
    
    forwardB <= x1 & (not(x1) and y1);

end Behavioral;
