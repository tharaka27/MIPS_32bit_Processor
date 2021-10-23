--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
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
end register_file;

architecture Behavioral of register_file is

    signal writeEnable  :   std_logic_vector(31 downto 0);
    type rom_type is array(0 to 31) of std_logic_vector(31 downto 0);
    signal regArray     : rom_type;

    component decorder is
      Port (
               writeRegister    :   in  std_logic_vector(4 downto 0);
               writeEnable      :   out std_logic_vector(31 downto 0);
               regWrite         :   in  std_logic
       );
    end component decorder;
    
    
    component register_32bit is
      Port (
        regOut  :   inout std_logic_vector(31 downto 0);
        regData :   in  std_logic_vector(31 downto 0);
        writeEn :   in  std_logic;
        reset   :   in  std_logic;
        clk     :   in  std_logic
       );
    end component register_32bit;
    
    component mux32x32to32 is
      Port (
            readData        :   out std_logic_vector(31 downto 0);
            readRegister    :   in  std_logic_vector(4 downto 0);
            In0             :   in  std_logic_vector(31 downto 0);
            In1             :   in  std_logic_vector(31 downto 0);
            In2             :   in  std_logic_vector(31 downto 0);
            In3             :   in  std_logic_vector(31 downto 0);
            In4             :   in  std_logic_vector(31 downto 0);
            In5             :   in  std_logic_vector(31 downto 0);
            In6             :   in  std_logic_vector(31 downto 0);
            In7             :   in  std_logic_vector(31 downto 0);
            In8             :   in  std_logic_vector(31 downto 0);
            In9             :   in  std_logic_vector(31 downto 0);
            In10            :   in  std_logic_vector(31 downto 0);
            In11            :   in  std_logic_vector(31 downto 0);
            In12            :   in  std_logic_vector(31 downto 0);
            In13            :   in  std_logic_vector(31 downto 0);
            In14            :   in  std_logic_vector(31 downto 0);
            In15            :   in  std_logic_vector(31 downto 0);
            In16            :   in  std_logic_vector(31 downto 0);
            In17            :   in  std_logic_vector(31 downto 0);
            In18            :   in  std_logic_vector(31 downto 0);
            In19            :   in  std_logic_vector(31 downto 0);
            In20            :   in  std_logic_vector(31 downto 0);
            In21            :   in  std_logic_vector(31 downto 0);
            In22            :   in  std_logic_vector(31 downto 0);
            In23            :   in  std_logic_vector(31 downto 0);
            In24            :   in  std_logic_vector(31 downto 0);
            In25            :   in  std_logic_vector(31 downto 0);
            In26            :   in  std_logic_vector(31 downto 0);
            In27            :   in  std_logic_vector(31 downto 0);
            In28            :   in  std_logic_vector(31 downto 0);
            In29            :   in  std_logic_vector(31 downto 0);
            In30            :   in  std_logic_vector(31 downto 0);
            In31            :   in  std_logic_vector(31 downto 0)
       );
    end component mux32x32to32;
    
begin


decorder_1: decorder port map(
        writeRegister    => writeRegister,
        writeEnable      => writeEnable,
        regWrite         => regWrite
);

R0 : register_32bit port map(
    regOut  =>  regArray(0),
    regData =>  "00000000000000000000000000000000",
    writeEn =>  '1',
    reset   =>  '0',
    clk     =>  clk
);
    
R32 : for i in 31 downto 1 generate
  Ri: register_32bit port map(
    regOut  =>  regArray(i),
    regData =>  writeData,
    writeEn =>  writeEnable(i),
    reset   =>  reset,
    clk     =>  clk
);
end generate;

mux1    : mux32x32to32 port map(
        readData     =>   readData1,
        readRegister =>   readRegister1,
        In0          =>   regArray(0),
        In1          =>   regArray(1),   
        In2          =>   regArray(2),   
        In3          =>   regArray(3),   
        In4          =>   regArray(4),   
        In5          =>   regArray(5),   
        In6          =>   regArray(6),   
        In7          =>   regArray(7),   
        In8          =>   regArray(8),   
        In9          =>   regArray(9),   
        In10         =>   regArray(10),   
        In11         =>   regArray(11),   
        In12         =>   regArray(12),   
        In13         =>   regArray(13),   
        In14         =>   regArray(14),   
        In15         =>   regArray(15),   
        In16         =>   regArray(16),  
        In17         =>   regArray(17),   
        In18         =>   regArray(18),   
        In19         =>   regArray(19),   
        In20         =>   regArray(20),   
        In21         =>   regArray(21),   
        In22         =>   regArray(22),   
        In23         =>   regArray(23),   
        In24         =>   regArray(24),   
        In25         =>   regArray(25),   
        In26         =>   regArray(26),   
        In27         =>   regArray(27),   
        In28         =>   regArray(28),   
        In29         =>   regArray(29),   
        In30         =>   regArray(30),   
        In31         =>   regArray(31)   
);

mux2    : mux32x32to32 port map(
        readData     =>   readData2,
        readRegister =>   readRegister2,
        In0          =>   regArray(0),
        In1          =>   regArray(1),   
        In2          =>   regArray(2),   
        In3          =>   regArray(3),   
        In4          =>   regArray(4),   
        In5          =>   regArray(5),   
        In6          =>   regArray(6),   
        In7          =>   regArray(7),   
        In8          =>   regArray(8),   
        In9          =>   regArray(9),   
        In10         =>   regArray(10),   
        In11         =>   regArray(11),   
        In12         =>   regArray(12),   
        In13         =>   regArray(13),   
        In14         =>   regArray(14),   
        In15         =>   regArray(15),   
        In16         =>   regArray(16),  
        In17         =>   regArray(17),   
        In18         =>   regArray(18),   
        In19         =>   regArray(19),   
        In20         =>   regArray(20),   
        In21         =>   regArray(21),   
        In22         =>   regArray(22),   
        In23         =>   regArray(23),   
        In24         =>   regArray(24),   
        In25         =>   regArray(25),   
        In26         =>   regArray(26),   
        In27         =>   regArray(27),   
        In28         =>   regArray(28),   
        In29         =>   regArray(29),   
        In30         =>   regArray(30),   
        In31         =>   regArray(31)   
);

end Behavioral;
