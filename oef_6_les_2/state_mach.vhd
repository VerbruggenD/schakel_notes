----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2022 11:07:48
-- Design Name: 
-- Module Name: state_mach - Behavioral
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

entity state_mach is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           pwm_25 : in STD_LOGIC;
           pwm_50 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC);
end state_mach;

architecture Behavioral of state_mach is

type my_state is (red, red25_green75, red50_green50, red75_green25, green, green25_blue75, 
green50_blue50, green75_blue25, blue, blue25_red75, blue50_red50, blue75_red25, reset_state);
signal next_state, state: my_state;

begin

state_next: process(state)
begin
    case state is
        when red =>
            next_state <= red75_green25;
        when red75_green25 =>
            next_state <= red50_green50;
        when red50_green50 =>
            next_state <= red25_green75;
        when red25_green75 =>
            next_state <= green;
        when green =>
            next_state <= green75_blue25;
        when green75_blue25 =>
            next_state <= green50_blue50;
        when green50_blue50 =>
            next_state <= green25_blue75;
        when green25_blue75 =>
            next_state <= blue;
        when blue =>
            next_state <= blue75_red25;
        when blue75_red25 =>
            next_state <= blue50_red50;
        when blue50_red50 =>
            next_state <= blue25_red75;
        when blue25_red75 =>
            next_state <= red;
        when reset_state =>
            next_state <= red;
        when others =>
            next_state <= reset_state;
    end case;
end process;

state_register: process(clk_in)
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

out_process: process(state, pwm_25, pwm_50)
begin
    case state is
        when red =>
            output <= "001";
        when red75_green25 =>
            output(0) <= not pwm_25;
            output(1) <= pwm_25;
            output(2) <= '0';
        when red50_green50 =>
            output(0) <= pwm_50;
            output(1) <= pwm_50;
            output(2) <= '0';
        when red25_green75 =>
            output(0) <= pwm_25;
            output(1) <= not pwm_25;
            output(2) <= '0';
        when green =>
            output <= "010";
        when green75_blue25 =>
            output(0) <= '0';
            output(1) <= not pwm_25;
            output(2) <= pwm_25;
        when green50_blue50 =>
            output(0) <= '0';
            output(1) <= pwm_50;
            output(2) <= pwm_50;
        when green25_blue75 =>
            output(0) <= '0';
            output(1) <= pwm_25;
            output(2) <= not pwm_25;
        when blue =>
            output <= "100";
        when blue75_red25 =>
            output(0) <= pwm_25;
            output(1) <= '0';
            output(2) <= not pwm_25;
        when blue50_red50 =>
            output(0) <= pwm_50;
            output(1) <= '0';
            output(2) <= not pwm_50;
        when blue25_red75 =>
            output(0) <= not pwm_25;
            output(1) <= '0';
            output(2) <= pwm_25;
        when reset_state =>
            output <= "000";
        when others =>
            output <= "000";
    end case;
end process;

end Behavioral;
