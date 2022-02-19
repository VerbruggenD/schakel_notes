----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2022 16:36:12
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end toplevel;

architecture Behavioral of toplevel is

signal clk_s : std_logic;

component prescaler is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component peripheral is
    Port ( clk_slow : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

inst_presc : prescaler
port map ( clk_in => clk,
            clk_out => clk_s);
            
inst_periph : peripheral
port map ( clk_slow => clk_s,
            output => led);


end Behavioral;
