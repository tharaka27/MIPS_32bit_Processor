--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mux32x32to32 is
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
end mux32x32to32;

architecture Behavioral of mux32x32to32 is
        type reg_type is array(0 to 31) of std_logic_vector(31 downto 0);
        signal arrayReg :   reg_type;
        
        component mux32to1 is
          Port (
            input   : in   std_logic_vector(31 downto 0);
            output  : out  std_logic;
            sel     : in   std_logic_vector(4 downto 0)
           );
        end component mux32to1;
begin


pro : process(In31, In30, In29 , In28 ,  In27 , In26 ,  In25 , In24 ,
              In23 , In22 ,  In21 , In20 ,  In19 , In18 ,  In17 , In16 ,
              In15 , In14 ,  In13 , In12 ,  In11 , In10 ,  In9  , In8 ,
              In7  , In6  ,  In5  , In4  ,  In3  , In2  ,  In1  , In0)
begin
    arrayLoop : for i in 0 to 31 loop
        arrayReg(i) <=  In31(i) & In30(i) &  In29(i) & In28(i) &  In27(i) & In26(i) &  In25(i) & In24(i) &
                        In23(i) & In22(i) &  In21(i) & In20(i) &  In19(i) & In18(i) &  In17(i) & In16(i) &
                        In15(i) & In14(i) &  In13(i) & In12(i) &  In11(i) & In10(i) &  In9(i)  & In8(i) &
                        In7(i)  & In6(i)  &  In5(i)  & In4(i)  &  In3(i)  & In2(i)  &  In1(i)  & In0(i);
    end loop arrayLoop;
end process pro;


mux32 : for i in 31 downto 0 generate
  muxi   :   mux32to1  port map(
    input   => arrayReg(i),
    output  => readData(i),
    sel     => readRegister
    );
end generate;

end Behavioral;
