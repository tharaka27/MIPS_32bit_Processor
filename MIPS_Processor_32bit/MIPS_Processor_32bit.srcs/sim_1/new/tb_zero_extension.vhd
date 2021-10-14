--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_zero_extension is
--  Port ( );
end tb_zero_extension;

architecture Behavioral of tb_zero_extension is

    component zero_extension is
      Port ( 
            z_in  : in std_logic_vector(15 downto 0);
            z_out : out std_logic_vector(31 downto 0)
       );
    end component zero_extension;
    
    signal z_in  : std_logic_vector(15 downto 0);
    signal z_out : std_logic_vector(31 downto 0);

begin

uut: zero_extension port map(
    z_in  => z_in,
    z_out => z_out
);


process
begin

    z_in <= "1111111111111110";
    wait for 10ns;
    
    z_in <= "0111111111111110";
    wait for 10ns;
    
    z_in <= "0110111101111110";
    wait for 10ns;
    
    z_in <= "0000000000000000";
    wait for 10ns;
       
    wait;
end process;

end Behavioral;
