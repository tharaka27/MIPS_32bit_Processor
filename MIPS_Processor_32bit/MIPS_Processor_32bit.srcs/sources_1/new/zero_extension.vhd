--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_extension is
  Port ( 
        z_in  : in std_logic_vector(15 downto 0);
        z_out : out std_logic_vector(31 downto 0)
   );
end zero_extension;

architecture Behavioral of zero_extension is

begin
z_out <= "0000000000000000" & z_in;

end Behavioral;
