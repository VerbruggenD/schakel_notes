----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2022 12:44:15
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
--  Port ( );
end toplevel_tb;

architecture Behavioral of toplevel_tb is

signal clk_s : std_logic;
signal led_r : std_logic;
signal led_g : std_logic;
signal led_b : std_logic;
signal reset_s : std_logic;

component toplevel is
    Port ( clk : in STD_LOGIC;
           led_r : out std_logic;
           led_g : out std_logic;
           led_b : out std_logic;
           reset_btn : in STD_LOGIC);
end component;

begin

inst_toplevel : toplevel
port map ( clk => clk_s,
           led_r => led_r,
           led_g => led_g,
           led_b => led_b,
           reset_btn => reset_s );

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
wait for 20ns;

wait;

end process;

end Behavioral;
