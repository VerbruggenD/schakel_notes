----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2022 10:42:24
-- Design Name: 
-- Module Name: PWM_tb - Behavioral
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

entity PWM_tb is
--  Port ( );
end PWM_tb;

architecture Behavioral of PWM_tb is

signal clk_s : std_logic;
signal tick_s : std_logic;
signal D25_S : std_logic;
signal D50_s : std_logic;
signal reset_s : std_logic;

component PWM is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           out_d25 : out STD_LOGIC;
           out_d50 : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

begin

inst_PWM : PWM
port map ( clk_in => clk_s,
           tick_in => tick_s,
           out_d25 => D25_s,
           out_d50 => D50_s,
           reset => reset_s );
           
process is
begin
    clk_s <= '1';
    wait for 1ns;
    clk_s <= '0';
    wait for 1ns;
end process;
           
process is
begin

reset_s <= '1';
wait for 10ns;
reset_s <= '0';

wait until clk_s'event;

tick_s <= '1';

wait for 30ns;

tick_s <= '0';

wait for 10ns;

wait;

end process;

end Behavioral;
