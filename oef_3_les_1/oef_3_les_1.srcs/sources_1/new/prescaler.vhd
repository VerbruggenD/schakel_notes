----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2022 16:36:12
-- Design Name: 
-- Module Name: prescaler - Behavioral
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

entity prescaler is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end prescaler;

architecture Behavioral of prescaler is

constant PRESCALER_MAX : integer := 125000000/16;
signal counter : integer;
signal tick : std_logic;
signal rst : std_logic :='0';

signal clk_s : std_logic;

begin

clk_out <= clk_s;

process(clk_in)
begin
    if clk_in'event and clk_in='1' then
        if rst = '1' then 
        counter <= 0;
        tick <= '0';
        else
            if counter = PRESCALER_MAX then 
            tick <= '1';
            counter <= 0;
            else
            tick <= '0';
            counter <= counter + 1;
            end if;
        end if;
     end if;
end process;

process(tick)
begin
    if tick = '1' then
        clk_s <= not clk_s;
    end if;
end process;


end Behavioral;
