--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux32x32to32 is
--  Port ( );
end tb_mux32x32to32;

architecture Behavioral of tb_mux32x32to32 is

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
    
    signal readData        :   std_logic_vector(31 downto 0);
    signal readRegister    :   std_logic_vector(4 downto 0);
    signal In0             :   std_logic_vector(31 downto 0);
    signal In1             :   std_logic_vector(31 downto 0);
    signal In2             :   std_logic_vector(31 downto 0);
    signal In3             :   std_logic_vector(31 downto 0);
    signal In4             :   std_logic_vector(31 downto 0);
    signal In5             :   std_logic_vector(31 downto 0);
    signal In6             :   std_logic_vector(31 downto 0);
    signal In7             :   std_logic_vector(31 downto 0);
    signal In8             :   std_logic_vector(31 downto 0);
    signal In9             :   std_logic_vector(31 downto 0);
    signal In10            :   std_logic_vector(31 downto 0);
    signal In11            :   std_logic_vector(31 downto 0);
    signal In12            :   std_logic_vector(31 downto 0);
    signal In13            :   std_logic_vector(31 downto 0);
    signal In14            :   std_logic_vector(31 downto 0);
    signal In15            :   std_logic_vector(31 downto 0);
    signal In16            :   std_logic_vector(31 downto 0);
    signal In17            :   std_logic_vector(31 downto 0);
    signal In18            :   std_logic_vector(31 downto 0);
    signal In19            :   std_logic_vector(31 downto 0);
    signal In20            :   std_logic_vector(31 downto 0);
    signal In21            :   std_logic_vector(31 downto 0);
    signal In22            :   std_logic_vector(31 downto 0);
    signal In23            :   std_logic_vector(31 downto 0);
    signal In24            :   std_logic_vector(31 downto 0);
    signal In25            :   std_logic_vector(31 downto 0);
    signal In26            :   std_logic_vector(31 downto 0);
    signal In27            :   std_logic_vector(31 downto 0);
    signal In28            :   std_logic_vector(31 downto 0);
    signal In29            :   std_logic_vector(31 downto 0);
    signal In30            :   std_logic_vector(31 downto 0);
    signal In31            :   std_logic_vector(31 downto 0);

begin

UUT : mux32x32to32 port map(
       readData     =>   readData,
       readRegister =>   readRegister,
       In0          =>   In0,
       In1          =>   In1,   
       In2          =>   In2,   
       In3          =>   In3,   
       In4          =>   In4,   
       In5          =>   In5,   
       In6          =>   In6,   
       In7          =>   In7,   
       In8          =>   In8,   
       In9          =>   In9,   
       In10         =>   In10,   
       In11         =>   In11,   
       In12         =>   In12,   
       In13         =>   In13,   
       In14         =>   In14,   
       In15         =>   In15,   
       In16         =>   In16,  
       In17         =>   In17,   
       In18         =>   In18,   
       In19         =>   In19,   
       In20         =>   In20,   
       In21         =>   In21,   
       In22         =>   In22,   
       In23         =>   In23,   
       In24         =>   In24,   
       In25         =>   In25,   
       In26         =>   In26,   
       In27         =>   In27,   
       In28         =>   In28,   
       In29         =>   In29,   
       In30         =>   In30,   
       In31         =>   In31   
);



stimu : process
begin
        readRegister <= "00010";
        In0          <= "00000000000000000000000000000001";
        In1          <= "10000000100000000000000100000000";   
        In2          <= "10000000000000000000000000000000";   
        In3          <= "10000000000000000000000000000000";   
        In4          <= "10000000000000000000000000000000"; 
        In5          <= "10000000000000000000000000000000";   
        In6          <= "10000000000000000000000000000000";  
        In7          <= "10000000000000000000000000000000"; 
        In8          <= "10000000000000000000000000000000";   
        In9          <= "10000000000000000000000000000000";  
        In10         <= "10000000000000000000000000000000";   
        In11         <= "10000000000000000000000000000000";   
        In12         <= "10000000000000000000000000000000";   
        In13         <= "10000000000000000000000000000000"; 
        In14         <= "10000000000000000000000000000000";   
        In15         <= "10000000000000000000000000000000";   
        In16         <= "10000000000000000000000000000000";  
        In17         <= "10000000000000000000000000000000";   
        In18         <= "10000000000000000000000000000000";   
        In19         <= "10000000000000000000000000000000";
        In20         <= "10000000000000000000000000000000";
        In21         <= "10000000000000000000000000000000";  
        In22         <= "10000000000000000000000000000000";   
        In23         <= "10000000000000000000000000000000";   
        In24         <= "10000000000000000000000000000000";  
        In25         <= "10000000000000000000000000000000";   
        In26         <= "10000000000000000000000000000000";   
        In27         <= "10000000000000000000000000000000";   
        In28         <= "10000000000000000000000000000000";   
        In29         <= "10000000000000000000000000000000";   
        In30         <= "10000000000000000000000000000000";   
        In31         <= "10000000000000000000000000000000";   
    wait for 10ns;
    
    readRegister <= "00001";
    wait for 10ns;
    
    readRegister <= "10000";
    wait for 10ns;
    wait;
end process stimu;
end Behavioral;
