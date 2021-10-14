--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_mux2to1 is
    generic(
            data_width : integer := 5
           );
end tb_mux2to1;

architecture Behavioral of tb_mux2to1 is
    component mux2to1 is
      Port (
        in_address_1 : in std_logic_vector(data_width -1 downto 0);
        in_address_2 : in std_logic_vector(data_width -1 downto 0);
        out_address  : out std_logic_vector(data_width -1 downto 0);
        sel          : in std_logic
       );
    end component mux2to1;
    
    signal in_address_1 : std_logic_vector(data_width -1 downto 0);
    signal in_address_2 : std_logic_vector(data_width -1 downto 0);
    signal out_address  : std_logic_vector(data_width -1 downto 0);
    signal sel          : std_logic;

begin

uut : mux2to1 port map(
    in_address_1 => in_address_1,
    in_address_2 => in_address_2,
    out_address  => out_address,
    sel          => sel
);

process
begin

    in_address_1 <= "11111";
    in_address_2 <= "00000";
    sel          <= '1';
    wait for 10ns;
    
    in_address_1 <= "11011";
    in_address_2 <= "00100";
    sel          <= '0';
    wait for 10ns;
    
    in_address_1 <= "00111";
    in_address_2 <= "00000";
    sel          <= '1';
    wait for 10ns;        
        
    wait;
end process;

end Behavioral;
