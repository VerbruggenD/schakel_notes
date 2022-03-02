----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2022 14:01:11
-- Design Name: 
-- Module Name: RGB_loop_6colors - Behavioral
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

entity RGB_loop_6colors is
    Port ( clk_in : in STD_LOGIC;
           tick : in std_logic;
           output : out std_logic_vector(2 downto 0);
           rst : in STD_LOGIC);
end RGB_loop_6colors;

architecture Behavioral of RGB_loop_6colors is

type my_state is (r_state, rg_state, g_state, gb_state, b_state, br_state, reset_state);
signal next_state, state: my_state;

begin

state_next : process(state)
begin
    case state is
        when r_state => 
            next_state <= rg_state;
        when rg_state => 
            next_state <= g_state;
        when g_state => 
            next_state <= gb_state;
        when gb_state => 
            next_state <= b_state;
        when b_state => 
            next_state <= br_state;
        when br_state => 
            next_state <= r_state;
        when reset_state => 
            next_state <= r_state;
    end case;
end process;

state_register : process(clk_in, tick)
begin
    if clk_in'event and clk_in = '1' then
        if rst = '1' then
            state <= reset_state;
        else
            if tick = '1' then
                state <= next_state;
            end if;
        end if;
    end if;
end process;

out_process : process(state)
begin
    case state is
        when r_state => 
            output <= "001";
        when rg_state => 
            output <= "011";
        when g_state => 
            output <= "010";
        when gb_state => 
            output <= "110";
        when b_state => 
            output <= "100";
        when br_state => 
            output <= "101";
        when reset_state => 
            output <= "000";
    end case;
end process;

end Behavioral;
