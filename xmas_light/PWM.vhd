----------------------------------------------------------------------------------
-- Company: UHasselt University
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 17.03.2022 14:36:22
-- Design Name: PWM
-- Module Name: PWM - Behavioral
-- Project Name: XMAS_Light
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
use IEEE.std_logic_unsigned.all;

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
           duty_in : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC;
           reset : in STD_LOGIC);
end PWM;

architecture Behavioral of PWM is

signal count : std_logic_vector(3 downto 0);

begin

process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            count <= "0000";
            output <= '0';
        else
            if tick_in = '1' then
                count <= count + 1;
            end if;
            
            if duty_in = "0000" then
                output <= '0';
            else 
                if duty_in = "1111" then
                    output <= '1';
                else 
                    if count = "0000" then
                        output <= '1';
                    else 
                        if count = duty_in then
                            output <= '0';
                        end if;
                    end if;
                end if;
            end if;
        end if;   
    end if;
end process;

end Behavioral;
