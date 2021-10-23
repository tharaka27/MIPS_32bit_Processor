

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_register_file is
--  Port ( );
end tb_register_file;

architecture Behavioral of tb_register_file is

    component register_file is
      Port (
            readRegister1 : in  std_logic_vector(4 downto 0);
            readRegister2 : in  std_logic_vector(4 downto 0);
            writeRegister : in  std_logic_vector(4 downto 0);
            writeData     : in  std_logic_vector(31 downto 0);
            regWrite      : in  std_logic;
            reset         : in  std_logic;
            clk           : in  std_logic;
            readData1     : out std_logic_vector(31 downto 0);
            readData2     : out std_logic_vector(31 downto 0)
       );
    end component register_file;


    signal readRegister1 : std_logic_vector(4 downto 0);
    signal readRegister2 : std_logic_vector(4 downto 0);
    signal writeRegister : std_logic_vector(4 downto 0);
    signal writeData     : std_logic_vector(31 downto 0);
    signal regWrite      : std_logic;
    signal reset         : std_logic;
    signal clk           : std_logic := '1';
    signal readData1     : std_logic_vector(31 downto 0);
    signal readData2     : std_logic_vector(31 downto 0);

begin
clk <= not clk after 5ns;


UUT : register_file port map(
    readRegister1 => readRegister1,
    readRegister2 => readRegister2,
    writeRegister => writeRegister,
    writeData   => writeData,
    regWrite    => regWrite,
    reset       => reset,
    clk         => clk,
    readData1   => readData1,
    readData2   => readData2
);

stimu: process
begin
    
    writeRegister <= "00100";
    writeData     <= "10000000000000000000000000000000";
    regWrite      <= '1';
    reset         <= '0';
    wait for 10ns;
    
    readRegister1 <= "00100";
    regWrite      <= '0';
    wait for 10ns;
        
    
    writeRegister <= "00001";
    writeData     <= "10000000000000000000000000000001";
    regWrite      <= '1';
    wait for 10ns;
    
    
    readRegister1 <= "00001";
    wait for 10ns;
        
    wait;
end process stimu;


end Behavioral;
