----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2022 19:14:47
-- Design Name: 
-- Module Name: led_select - Behavioral
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

entity led_select is
    Port ( clk_in : in STD_LOGIC;
           cmd_valid : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           led_out : out STD_LOGIC_VECTOR (3 downto 0);
           freq_1hz_in : in STD_LOGIC;
           freq_2hz_in : in STD_LOGIC;
           freq_4hz_in : in STD_LOGIC;
           freq_8hz_in : in STD_LOGIC;
           reset : in STD_LOGIC );
end led_select;

architecture Behavioral of led_select is

signal led_select_data : std_logic_vector(3 downto 0);

signal led1_cmd : std_logic_vector (3 downto 0);
signal led2_cmd : std_logic_vector (3 downto 0);
signal led3_cmd : std_logic_vector (3 downto 0);
signal led4_cmd : std_logic_vector (3 downto 0);

component led_control is
    Port ( clk_in : in STD_LOGIC;
           led_cmd : in STD_LOGIC_VECTOR (3 downto 0);
           led_out : out STD_LOGIC;
           reset : in STD_LOGIC;
           freq_1hz : in STD_LOGIC;
           freq_2hz : in STD_LOGIC;
           freq_4hz : in STD_LOGIC;
           freq_8hz : in STD_LOGIC);
end component;

begin
led_select_data <= cmd(7 downto 4);

inst_led0 : led_control
port map ( clk_in => clk_in,
           led_cmd => led1_cmd,
           led_out => led_out(0),
           reset => reset,
           freq_1hz => freq_1hz_in,
           freq_2hz => freq_2hz_in,
           freq_4hz => freq_4hz_in,
           freq_8hz => freq_8hz_in );
           
inst_led1 : led_control
port map ( clk_in => clk_in,        
           led_cmd => led2_cmd,
           led_out => led_out(1),
           reset => reset, 
           freq_1hz => freq_1hz_in,
           freq_2hz => freq_2hz_in,
           freq_4hz => freq_4hz_in,
           freq_8hz => freq_8hz_in );

inst_led2 : led_control
port map ( clk_in => clk_in,
           led_cmd => led3_cmd,
           led_out => led_out(2),
           reset => reset,
           freq_1hz => freq_1hz_in,
           freq_2hz => freq_2hz_in,
           freq_4hz => freq_4hz_in,
           freq_8hz => freq_8hz_in );           

inst_led3 : led_control
port map ( clk_in => clk_in,
           led_cmd => led4_cmd,
           led_out => led_out(3),
           reset => reset,
           freq_1hz => freq_1hz_in,
           freq_2hz => freq_2hz_in,
           freq_4hz => freq_4hz_in,
           freq_8hz => freq_8hz_in );
           
process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            led1_cmd <= "0000";
            led2_cmd <= "0000";
            led3_cmd <= "0000";
            led4_cmd <= "0000";
        else
            if cmd_valid = '1' then
                if led_select_data(0) = '1'  then
                    led1_cmd <= cmd(3 downto 0);
                end if;
                if led_select_data(1) = '1'  then
                    led2_cmd <= cmd(3 downto 0);
                end if;
                if led_select_data(2) = '1'  then
                    led3_cmd <= cmd(3 downto 0);
                end if;
                if led_select_data(3) = '1'  then
                    led4_cmd <= cmd(3 downto 0);
                end if;
            end if;
        end if;
    end if;
end process;

end Behavioral;
