--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_WB_forward_unit is
--  Port ( );
end tb_WB_forward_unit;

architecture Behavioral of tb_WB_forward_unit is

    component WB_forward_unit is
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
    end component WB_forward_unit;

    signal readData1Out    : std_logic_vector(31 downto 0);
    signal readData2Out    : std_logic_vector(31 downto 0);
    signal readData1       : std_logic_vector(31 downto 0);
    signal readData2       : std_logic_vector(31 downto 0);
    signal writeData       : std_logic_vector(31 downto 0);
    signal rs              : std_logic_vector(4 downto 0);
    signal rt              : std_logic_vector(4 downto 0);
    signal writeRegister   : std_logic_vector(4 downto 0);
    signal regWrite        : std_logic;
    
begin


    UUT : WB_forward_unit port map(
            readData1Out => readData1Out,
            readData2Out => readData2Out,
            readData1   => readData1,
            readData2   => readData2,
            writeData   => writeData,
            rs          => rs,
            rt          => rt,
            writeRegister => writeRegister,
            regWrite      => regWrite
    );
    
    stimuli : process
    begin
            readData1 <= "00000000000000000000000000000001";
            readData2 <= "00000000000000000000000000000111";
            writeData <= "10000000000000000000000000000000";
            rs        <= "10101";
            rt        <= "10111";
            writeRegister <= "10101";
            regWrite  <= '1';
            wait for 10ns;
                
    end process stimuli;
end Behavioral;
