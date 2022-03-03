----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2022 16:36:12
-- Design Name: 
-- Module Name: peripheral - Behavioral
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

entity peripheral is
    Port ( clk_slow : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end peripheral;

architecture Behavioral of peripheral is

begin

output(0) <= clk_slow;
output(1) <= clk_slow;
output(2) <= clk_slow;
output(3) <= clk_slow;

end Behavioral;
