----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 13:13:48
-- Design Name: 
-- Module Name: led_select_tb - Behavioral
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

entity led_select_tb is
--  Port ( );
end led_select_tb;

architecture Behavioral of led_select_tb is

signal clk_s : std_logic;
signal tick_in_s : std_logic;
signal cmd_valid_s : std_logic;
signal cmd_s : std_logic_vector (31 downto 0 );
signal led_out_s : std_logic_vector (3 downto 0);
signal reset_s : std_logic;

component led_select is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           cmd_valid : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           led_out : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC );
end component;

begin

inst_led_select : led_select
port map ( clk_in => clk_s,
           tick_in => tick_in_s,
           cmd_valid => cmd_valid_s,
           cmd => cmd_s,
           led_out => led_out_s,
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
    
    wait for 2ns;
    wait until clk_s'event;
    
    reset_s <= '0';
    tick_in_s <= '1';
    
    wait until clk_s'event;
    
    cmd_s <= (others => '0');
    cmd_s(3 downto 0) <= "0000";
    cmd_s(7 downto 4) <= "1111";
    wait until clk_s'event;
    cmd_valid_s <= '1';
    wait for 3 ns;
    cmd_valid_s <= '0';
    wait until clk_s'event;
    
    cmd_s <= (others => '0');
    cmd_s(3 downto 0) <= "0001";
    cmd_s(7 downto 4) <= "0100";
    wait until clk_s'event;
    cmd_valid_s <= '1';
    wait for 3 ns;
    cmd_valid_s <= '0';
    wait until clk_s'event;
    
    cmd_s <= (others => '0');
    cmd_s(3 downto 0) <= "0100";
    cmd_s(7 downto 4) <= "0001";
    wait until clk_s'event;
    cmd_valid_s <= '1';
    wait for 3 ns;
    cmd_valid_s <= '0';
    wait until clk_s'event;
    
    cmd_s <= (others => '0');
    cmd_s(3 downto 0) <= "0000";
    cmd_s(7 downto 4) <= "1111";
    wait until clk_s'event;
    cmd_valid_s <= '1';
    wait for 3 ns;
    cmd_valid_s <= '0';
    wait until clk_s'event;
    
    wait;
    
end process;

end Behavioral;
