----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2022 18:00:26
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
           led : out STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC);
end toplevel;

architecture Behavioral of toplevel is

signal tick_s : std_logic;

component prescaler is
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end component;

component counter is
    Port ( clk : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC);
end component;

begin

inst_prescaler : prescaler
port map ( clk_in => clk,
            tick => tick_s,
            rst => btn );
            
inst_count : counter
port map ( clk => clk,
            tick_in => tick_s,
            output => led,
            reset => btn );

end Behavioral;
