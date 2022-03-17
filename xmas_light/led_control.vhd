----------------------------------------------------------------------------------
-- Company: UHasselt
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 03.03.2022 16:38:32
-- Design Name: led_control
-- Module Name: led_control - Behavioral
-- Project Name: XMas_light
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

entity led_control is
    Port ( clk_in : in STD_LOGIC;
           led_cmd : in STD_LOGIC_VECTOR (3 downto 0);
           led_out : out STD_LOGIC;
           reset : in STD_LOGIC;
           freq_1hz : in STD_LOGIC;
           freq_2hz : in STD_LOGIC;
           freq_4hz : in STD_LOGIC;
           freq_8hz : in STD_LOGIC);
end led_control;

architecture Behavioral of led_control is

type mystate is (reset_state, read_cmd, led_off, led_on, led_blink);
signal state, next_state : mystate;

signal blink : std_logic;

component freq_select is
    Port ( clk_in : in STD_LOGIC;
           freq_1hz_in : in STD_LOGIC;
           freq_2hz_in : in STD_LOGIC;
           freq_4hz_in : in STD_LOGIC;
           freq_8hz_in : in STD_LOGIC;
           freq_cmd : in STD_LOGIC_VECTOR (1 downto 0);
           freq_out : out STD_LOGIC;
           reset : in std_logic);
end component;

begin

inst_freq_select : freq_select
port map ( clk_in => clk_in,
           freq_1hz_in => freq_1hz,
           freq_2hz_in => freq_2hz,
           freq_4hz_in => freq_4hz,
           freq_8hz_in => freq_8hz,
           freq_cmd => led_cmd(1 downto 0),
           freq_out => blink,
           reset => reset);

state_next : process(state, led_cmd)
begin
    case state is
        when read_cmd =>
            case led_cmd is
                when "0000" =>
                    next_state <= led_off;
                when "0001" =>
                    next_state <= led_on;
                when others =>
                    next_state <= led_blink;
            end case;
        
        when led_off =>
            case led_cmd is
                when "0000" =>
                    next_state <= led_off;
                when "0001" =>
                    next_state <= led_on;
                when others =>
                    next_state <= led_blink;
            end case;
            
        
        when led_on =>
            case led_cmd is
                when "0000" =>
                    next_state <= led_off;
                when "0001" =>
                    next_state <= led_on;
                when others =>
                    next_state <= led_blink;
            end case;
        
        when led_blink =>
            case led_cmd is
                when "0000" =>
                    next_state <= led_off;
                when "0001" =>
                    next_state <= led_on;
                when others =>
                    next_state <= led_blink;
            end case;
        
        when reset_state =>
            next_state <= read_cmd;
    end case;
end process;

state_register : process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            state <= reset_state;
        else
            state <= next_state;
        end if;
    end if;
end process;

out_process : process(state, blink)
begin
    case state is
        when led_off =>
            led_out <= '0';
        when led_on =>
            led_out <= '1';
        when led_blink =>
            led_out <= blink;
        when others =>
            led_out <= '0';
    end case;
end process;

end Behavioral;
