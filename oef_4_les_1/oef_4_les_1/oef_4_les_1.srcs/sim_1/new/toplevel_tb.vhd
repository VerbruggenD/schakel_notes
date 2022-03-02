----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2022 18:20:18
-- Design Name: 
-- Module Name: toplevel_tb - Behavioral
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

entity toplevel_tb is

end toplevel_tb;

architecture Behavioral of toplevel_tb is

signal clk_s : std_logic;
signal led_s : std_logic_vector(3 downto 0);
signal reset_s : std_logic;

component toplevel is
port ( clk : in std_logic;
       led : out std_logic_vector(3 downto 0);
       btn : in std_logic);
end component;

begin

inst_toplevel : toplevel
port map ( clk => clk_s,
           led => led_s,
           btn => reset_s );
           
process is
begin
    clk_s <= '1';
    wait for 2ns;
    clk_s <= '0';
    wait for 2ns;
end process;
           
process is
begin

reset_s <= '1';

wait for 2 us;

reset_s <= '0';

for i in 0 to 10 loop
    wait until clk_s'event and clk_s = '1';
end loop;    

wait;

end process;

end Behavioral;
