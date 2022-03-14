----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 16:17:06
-- Design Name: 
-- Module Name: led_component - Behavioral
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

entity led_component is
    Port ( clk_in : in STD_LOGIC;
           cmd_valid : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           led_out : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC);
end led_component;

architecture Behavioral of led_component is

signal freq_1hz_s : std_logic;
signal freq_2hz_s : std_logic;
signal freq_4hz_s : std_logic;
signal freq_8hz_s : std_logic;

component led_select is
    Port ( clk_in : in STD_LOGIC;
           cmd_valid : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           led_out : out STD_LOGIC_VECTOR (3 downto 0);
           freq_1hz_in : in STD_LOGIC;
           freq_2hz_in : in STD_LOGIC;
           freq_4hz_in : in STD_LOGIC;
           freq_8hz_in : in STD_LOGIC;
           reset : in STD_LOGIC );
end component;

component freq_gen is
    Port ( clk_in : in STD_LOGIC;
           freq_1hz_out : out STD_LOGIC;
           freq_2hz_out : out STD_LOGIC;
           freq_4hz_out : out STD_LOGIC;
           freq_8hz_out : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

begin

inst_led_select : led_select
port map ( clk_in => clk_in,
            cmd_valid => cmd_valid,
            cmd => cmd,
            led_out => led_out,
            freq_1hz_in => freq_1hz_s,
            freq_2hz_in => freq_2hz_s,
            freq_4hz_in => freq_4hz_s,
            freq_8hz_in => freq_8hz_s,
            reset => reset );
            
inst_freq_gen : freq_gen
port map ( clk_in => clk_in,
            freq_1hz_out => freq_1hz_s,
            freq_2hz_out => freq_2hz_s,
            freq_4hz_out => freq_4hz_s,
            freq_8hz_out => freq_8hz_s,
            reset => reset );

end Behavioral;
