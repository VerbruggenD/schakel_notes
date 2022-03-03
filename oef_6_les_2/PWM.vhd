----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2022 17:27:05
-- Design Name: 
-- Module Name: PWM - Behavioral
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

entity PWM is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           out_d25 : out STD_LOGIC;
           out_d50 : out STD_LOGIC;
           reset : in STD_LOGIC);
end PWM;

architecture Behavioral of PWM is

signal count : integer;
constant count_max : integer := 3;

begin

process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            count <= 0;
        else
            if tick_in = '1' then
                if count < count_max then
                    count <= count + 1;
                else 
                    count <= 0;
                end if;
            end if;
        end if;   
    end if;
end process;

process(count)
begin

    case count is
        when 0 =>
            out_d25 <= '1';
            out_d50 <= '1';
        when 1 =>
            out_d25 <= '0';
            out_d50 <= '1';
        when 2 =>
            out_d25 <= '0';
            out_d50 <= '0';
        when others =>
            out_d25 <= '0';
            out_d50 <= '0';
    end case;       

end process;

end Behavioral;
