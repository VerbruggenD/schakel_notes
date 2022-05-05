----------------------------------------------------------------------------------
-- Company: UHasselt
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 17.02.2022 16:36:12
-- Design Name: prescaler
-- Module Name: prescaler - Behavioral
-- Project Name: XMas_Light
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

entity prescaler is
    generic ( divider : integer );
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end prescaler;

architecture Behavioral of prescaler is

constant PRESCALER_MAX : integer := 100000000/(divider);
signal counter : integer;

begin

process(clk_in,rst)
begin
    if clk_in'event and clk_in = '1' then
        if rst = '1' then 
            counter <= 0;
            tick <= '0';
        else
            if counter >= PRESCALER_MAX then
                counter <= 0;
                tick <= '1';
            else
                counter <= counter + 1;
                tick <= '0';
            end if;
        end if;
     end if;
end process;

end Behavioral;

