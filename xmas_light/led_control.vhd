----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2022 16:38:32
-- Design Name: 
-- Module Name: led_control - Behavioral
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

entity led_control is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           new_cmd : in STD_LOGIC;
           led_cmd : in STD_LOGIC_VECTOR (3 downto 0);
           led_out : out STD_LOGIC;
           reset : in STD_LOGIC);
end led_control;

architecture Behavioral of led_control is

type mystate is (reset_state, read_cmd, led_off, led_on, led_blink);
signal state, next_state : mystate;

signal blink : std_logic;
signal freq : std_logic_vector(2 downto 0);

begin

state_next : process(state, new_cmd)
begin
    case state is
        when read_cmd =>
            if new_cmd = '1' then
                case led_cmd is
                    when "0000" =>
                        next_state <= led_off;
                    when "0001" =>
                        next_state <= led_on;
                    when others =>
                        next_state <= led_blink;
                end case;
            else
                next_state <= read_cmd;
            end if;
        
        when led_off =>
            if new_cmd = '1' then
                case led_cmd is
                    when "0000" =>
                        next_state <= led_off;
                    when "0001" =>
                        next_state <= led_on;
                    when others =>
                        next_state <= led_blink;
                end case;
            else
                next_state <= led_off;
            end if;
            
        
        when led_on =>
            if new_cmd = '1' then
                case led_cmd is
                    when "0000" =>
                        next_state <= led_off;
                    when "0001" =>
                        next_state <= led_on;
                    when others =>
                        next_state <= led_blink;
                end case;
            else
                next_state <= led_on;
            end if;
        
        when led_blink =>
            if new_cmd = '1' then
                case led_cmd is
                    when "0000" =>
                        next_state <= led_off;
                    when "0001" =>
                        next_state <= led_on;
                    when others =>
                        next_state <= led_blink;
                end case;
            else
                next_state <= led_blink;
            end if;
        
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
            if tick_in = '1' then
                state <= next_state;
            end if;
        end if;
    end if;
end process;

out_process : process(state)
begin
    case state is
        when led_off =>
            led_out <= '0';
        when led_on =>
            led_out <= '1';
        when led_blink =>
            led_out <= blink;
            freq <= led_cmd(3 downto 1);
        when others =>
            led_out <= '0';
    end case;
end process;

end Behavioral;
