--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_forwarding_unit is
--  Port ( );
end tb_forwarding_unit;

architecture Behavioral of tb_forwarding_unit is
    component forwarding_unit is
        Port (
                forwardA    : out std_logic_vector(1 downto 0);
                forwardB    : out std_logic_vector(1 downto 0);
                mem_regWrite: in  std_logic;
                WB_regWrite : in  std_logic;
                mem_writeReg: in  std_logic_vector(4 downto 0);
                WB_writeReg : in  std_logic_vector(4 downto 0);
                Ex_rs       : in  std_logic_vector(4 downto 0);
                Ex_rt       : in  std_logic_vector(4 downto 0)
        );
    end component forwarding_unit;
    
    signal forwardA    :    std_logic_vector(1 downto 0);
    signal forwardB    :    std_logic_vector(1 downto 0);
    signal mem_regWrite:    std_logic;
    signal WB_regWrite :    std_logic;
    signal mem_writeReg:    std_logic_vector(4 downto 0);
    signal WB_writeReg :    std_logic_vector(4 downto 0);
    signal Ex_rs       :    std_logic_vector(4 downto 0);
    signal Ex_rt       :    std_logic_vector(4 downto 0);
    
begin

UUT : forwarding_unit port map(
        forwardA        => forwardA,
        forwardB        => forwardB,
        mem_regWrite    => mem_regWrite, 
        WB_regWrite     => WB_regWrite,
        mem_writeReg    => mem_writeReg,
        WB_writeReg     => WB_writeReg,
        Ex_rs           => Ex_rs,
        Ex_rt           => Ex_rt
);

    process
        begin   
        
        -- 0 0 - expected output 00
        mem_regWrite <= '1';
        WB_regWrite  <= '1';
        mem_writeReg <= "10101";
        WB_writeReg  <= "00100";
        Ex_rs        <= "10111";
        Ex_rt        <= "10100";
        wait for 20ns;
        
        -- 1 1 - expected output 10
        mem_regWrite <= '1';
        WB_regWrite  <= '1';
        mem_writeReg <= "10101";
        WB_writeReg  <= "00100";
        Ex_rs        <= "10101";
        Ex_rt        <= "00100";
        wait for 20ns;
        
        
        -- 0 1 - expected output 01
        mem_regWrite <= '1';
        WB_regWrite  <= '1';
        mem_writeReg <= "11101";
        WB_writeReg  <= "00100";
        Ex_rs        <= "00100";
        Ex_rt        <= "00100";
        
        wait;
    end process;

end Behavioral;
