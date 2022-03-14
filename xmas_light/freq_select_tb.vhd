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

entity freq_select_tb is
--  Port ( );
end freq_select_tb;

architecture Behavioral of freq_select_tb is

signal clk_s : std_logic;
signal reset_s : std_logic;
signal freq_1hz_in : std_logic;
signal freq_2hz_in : std_logic;
signal freq_4hz_in : std_logic;
signal freq_8hz_in : std_logic;
signal freq_cmd : std_logic_vector(1 downto 0);
signal freq_select_s : std_logic;
signal freq_out : std_logic;

component freq_select is
    Port ( clk_in : in STD_LOGIC;
           freq_1hz_in : in STD_LOGIC;
           freq_2hz_in : in STD_LOGIC;
           freq_4hz_in : in STD_LOGIC;
           freq_8hz_in : in STD_LOGIC;
           freq_cmd : in STD_LOGIC_VECTOR (1 downto 0);
           freq_select : in std_logic;
           freq_out : out STD_LOGIC;
           reset : in std_logic);
end component;

begin

inst_freq_select : freq_select
port map ( clk_in => clk_s,
           freq_1hz_in => freq_1hz_in,
           freq_2hz_in => freq_2hz_in,
           freq_4hz_in => freq_4hz_in,
           freq_8hz_in => freq_8hz_in,
           freq_cmd  => freq_cmd,
           freq_select => freq_select_s,
           freq_out => freq_out,
           reset => reset_s);
           
process is
begin
    clk_s <= '1';
    wait for 5ns;
    clk_s <= '0';
    wait for 5ns;
end process;

process is
begin
    if clk_s'event and clk_s = '1' then
        freq_1hz_in <= not freq_1hz_in;
        freq_2hz_in <= not freq_2hz_in;
        freq_4hz_in <= not freq_4hz_in;
        freq_8hz_in <= not freq_8hz_in;
    end if;
end process;

process is
begin
    freq_select_s <= '0';
    freq_cmd <= "00";
    reset_s <= '1';
    freq_1hz_in <= '0';
    freq_2hz_in <= '0';
    freq_4hz_in <= '0';
    freq_8hz_in <= '0';
    
    wait for 10ns;
    wait until clk_s'event;
    
    reset_s <= '0';
    
    wait until clk_s'event;
    
    freq_cmd <= "11";
    
    wait until clk_s'event;
    
    freq_select_s <= '1';
    
    wait until clk_s'event;
    wait until clk_s'event;
    
    freq_select_s <= '0';
    
    wait until clk_s'event;
    wait until clk_s'event;

    freq_cmd <= "00";
    
    wait;
    
end process;

end Behavioral;
