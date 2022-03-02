----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2022 18:00:26
-- Design Name: 
-- Module Name: freq_divider - Behavioral
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

entity freq_divider is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           tick_out : out std_logic;
           reset : in STD_LOGIC);
end freq_divider;

architecture Behavioral of freq_divider is

signal tick_s : std_logic;
signal count : integer;

begin

tick_out <= tick_s;

process(clk_in,reset)
begin

    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            count <= 0;
            
        else
            if 
        end if;
    end if;
end process;

end Behavioral;
