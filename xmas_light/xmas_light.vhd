----------------------------------------------------------------------------------
-- Company: UHasselt
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 03.03.2022 16:01:26
-- Design Name: xmas_light
-- Module Name: xmas_light - Behavioral
-- Project Name: xmas_light
-- Target Devices: PYNQ-Z2
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

entity xmas_light is
  port (
    reset : in STD_LOGIC;
    clock : in STD_LOGIC;
    command : in STD_LOGIC_VECTOR(31 downto 0);
    command_valid : in STD_LOGIC;
    RGB0 : out STD_LOGIC_VECTOR(2 downto 0);
    RGB1 : out STD_LOGIC_VECTOR(2 downto 0);
    LEDs : out STD_LOGIC_VECTOR(3 downto 0)
  );
end xmas_light;

architecture Behavioural of xmas_light is

component led_component is
    Port ( clk_in : in STD_LOGIC;
           cmd_valid : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           led_out : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC);
end component;

begin

inst_led_comp : led_component
port map ( clk_in => clock,
            cmd_valid => command_valid,
            cmd => command,
            led_out => LEDs,
            reset => reset );

end Behavioural;