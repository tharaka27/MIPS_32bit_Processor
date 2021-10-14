--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
  generic(
        data_width : integer := 5
  );

  Port (
    in_address_1 : in std_logic_vector(data_width -1 downto 0);
    in_address_2 : in std_logic_vector(data_width -1 downto 0);
    out_address  : out std_logic_vector(data_width -1 downto 0);
    sel          : in std_logic
   );
end mux2to1;

architecture Behavioral of mux2to1 is
begin
process(sel) is
    begin
        if(sel = '1') then
            out_address <= in_address_1;
        else
            out_address <= in_address_2;
        end if; 
end process;
end Behavioral;
