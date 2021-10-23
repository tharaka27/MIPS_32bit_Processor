--
-- Written by Tharaka Ratnayake
--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity WB_forward_unit is
  Port ( 
        readData1Out    : out std_logic_vector(31 downto 0);
        readData2Out    : out std_logic_vector(31 downto 0);
        readData1       : in  std_logic_vector(31 downto 0);
        readData2       : in  std_logic_vector(31 downto 0);
        writeData       : in  std_logic_vector(31 downto 0);
        rs              : in  std_logic_vector(4 downto 0);
        rt              : in  std_logic_vector(4 downto 0);
        writeRegister   : in  std_logic_vector(4 downto 0);
        regWrite        : in  std_logic
  );
end WB_forward_unit;

architecture Behavioral of WB_forward_unit is
        
        signal readSourceRS    : std_logic;
        signal readSourceRT    : std_logic;
        signal compOut1        : std_logic;
        signal compOut2        : std_logic;
        signal orOut1          : std_logic;
        
        component mux2x32to32 is
            port(
                A       : in std_logic_vector (31 downto 0);
                B       : in std_logic_vector (31 downto 0);
                Sel     : in std_logic;
                Output  : out std_logic_vector (31 downto 0)
            );
         end component mux2x32to32;
    -- 11111
begin
    
    orOut1 <= writeRegister(4) or writeRegister(3) or writeRegister(2)
                or writeRegister(1) or writeRegister(0);
    compOut1 <= (not(writeRegister(4) xor rs(4))) and 
                   (not(writeRegister(3) xor rs(3))) and
                    (not(writeRegister(2) xor rs(2))) and
                     (not(writeRegister(1) xor rs(1))) and
                      (not(writeRegister(0) xor rs(0)));
    readSourceRS <= regWrite and orOut1 and compOut1;
    
    
    compOut2 <= (not(writeRegister(4) xor rt(4))) and 
                   (not(writeRegister(3) xor rt(3))) and
                    (not(writeRegister(2) xor rt(2))) and
                     (not(writeRegister(1) xor rt(1))) and
                      (not(writeRegister(0) xor rt(0)));
    readSourceRT <= regWrite and orOut1 and compOut2;
    
    mux_1 : mux2x32to32 port map(
            A => readData1,
            B => writeData,
            Sel => readSourceRS,
            Output => readData1Out
    );
    
    mux_2 : mux2x32to32 port map(
            A => readData2,
            B => writeData,
            Sel => readSourceRT,
            Output => readData2Out
    );

end Behavioral;
