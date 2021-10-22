----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 12:43:32 PM
-- Design Name: 
-- Module Name: Stall_control_unit_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Stall_control_unit_TB is
--  Port ( );
end Stall_control_unit_TB;

architecture Behavioral of Stall_control_unit_TB is
    
     -- input
    signal E_M_R : std_logic;
    signal E_rt : std_logic_vector (4 downto 0);
    signal Id_s : std_logic_vector (4 downto 0);
    signal Id_t : std_logic_vector (4 downto 0);
    signal Id_ope : std_logic_vector (5 downto 0);
    
    -- output
    signal Pc_w_en : std_logic;
    signal IfId_w_en : std_logic;
    signal stall : std_logic;
    
    component StallControl_Unit
        port(
            Ex_Mem_R : in std_logic;
            Ex_rt : in std_logic_vector (4 downto 0);
            Id_rs : in std_logic_vector (4 downto 0);
            Id_rt : in std_logic_vector (4 downto 0);
            Id_op : in std_logic_vector (5 downto 0);
            Pc_write_enable : out std_logic;
            IfId_write_enable : out std_logic;
            stall_flush : out std_logic
        );
    end component;
    
begin

    Stall_cntrl: StallControl_Unit port map (
        Ex_Mem_R => E_M_R,
        Ex_rt => E_rt,
        Id_rs => Id_s,
        Id_rt => Id_t,
        Id_op => Id_ope,
        Pc_write_enable => Pc_w_en,
        IfId_write_enable => IfId_w_en,
        stall_flush => stall
    );
    
    TB : process 
    begin 
    
        E_M_R <= '1';
        E_rt <= "11111";
        Id_s <= "11111";
        Id_t <= "10100";
        Id_ope <= "001110";
        
        wait for 5ns;
        
        E_M_R <= '0';
        E_rt <= "11111";
        Id_s <= "11111";
        Id_t <= "10100";
        Id_ope <= "001110";
        
        wait for 5ns;
        
        E_M_R <= '1';
        E_rt <= "11111";
        Id_s <= "11101";
        Id_t <= "11111";
        Id_ope <= "001110";
        
        wait for 5ns;
        
        E_M_R <= '0';
        E_rt <= "11111";
        Id_s <= "10011";
        Id_t <= "11111";
        Id_ope <= "001110";
        
        wait for 5ns;
        
        E_M_R <= '1';
        E_rt <= "11111";
        Id_s <= "11100";
        Id_t <= "11111";
        Id_ope <= "001111";
        
        wait for 5ns;
        
        E_M_R <= '1';
        E_rt <= "11111";
        Id_s <= "11101";
        Id_t <= "11111";
        Id_ope <= "100011";
        
        wait for 5ns;
        
        E_M_R <= '1';
        E_rt <= "11111";
        Id_s <= "11111";
        Id_t <= "11111";
        Id_ope <= "001110";
        
        wait for 5ns;
        
        E_M_R <= '0';
        E_rt <= "11111";
        Id_s <= "11111";
        Id_t <= "11111";
        Id_ope <= "100011";
        
        wait for 5ns;
        
        E_M_R <= '1';
        E_rt <= "10111";
        Id_s <= "11111";
        Id_t <= "11111";
        Id_ope <= "001110";
        
        wait;
        
    end process;

end Behavioral;
