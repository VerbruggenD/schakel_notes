----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2022 15:18:28
-- Design Name: 
-- Module Name: 4bit_counter - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clk : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC);
end counter;

architecture Behavioral of counter is

signal count : std_logic_vector(3 downto 0);

begin

output <= count;

process(clk)
begin

if clk'event and clk = '1' then
    if reset = '1' then
        count <= "0000";
    else
        if tick_in = '1' then
            count <= count + 1;
        end if;
    end if;
end if;

end process;

end Behavioral;
