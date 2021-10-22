--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_mux2x32to32 is
--  Port ( );
end tb_mux2x32to32;

architecture Behavioral of tb_mux2x32to32 is
    -- inputs
    signal num1 : std_logic_vector (31 downto 0);
    signal num2 : std_logic_vector (31 downto 0);
    signal sel  : std_logic;
    
    -- output
    signal result : std_logic_vector (31 downto 0);
    
    component mux2x32to32 is
        port(
            A       : in std_logic_vector (31 downto 0);
            B       : in std_logic_vector (31 downto 0);
            Sel     : in std_logic;
            Output  : out std_logic_vector (31 downto 0)
        );
     end component mux2x32to32;
begin

UUT :mux2x32to32 port map (
        A => num1,
        B => num2,
        Sel => sel,
        Output => result
    );
    
TB : process 
    begin 
      
     num1 <= "00000000000000000000000000000001";
     num2 <= "00000000000000000000000000000010"; 
     sel <= '1';
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000000101";
     num2 <= "00000000000000000000000000000011"; 
     sel <= '0';
     
     wait for 5ns;
     wait;
     
     end process;

end Behavioral;
