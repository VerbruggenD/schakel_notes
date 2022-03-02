----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2022 13:54:37
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
           led4_r : out STD_LOGIC;
           led4_g : out STD_LOGIC;
           led4_b : out STD_LOGIC;
           btn_rst : in STD_LOGIC);
end toplevel;

architecture Behavioral of toplevel is

signal tick_s : std_logic;
signal output_s : std_logic_vector(2 downto 0);

component prescaler is
port ( clk_in : in STD_LOGIC;
       tick : out STD_LOGIC;
       rst : in std_logic);
end component;

component RGB_loop_6colors is
Port ( clk_in : in STD_LOGIC;
           tick : in std_logic;
           output : out std_logic_vector(2 downto 0);
           rst : in STD_LOGIC);
end component;

begin

led4_r <= output_s(0);
led4_g <= output_s(1);
led4_b <= output_s(2);

inst_prescale : prescaler
port map ( clk_in => clk,
           tick => tick_s,
           rst => btn_rst );
           
inst_RGB : RGB_loop_6colors
port map ( clk_in => clk,
            tick => tick_s,
            output => output_s,
            rst => btn_rst );

end Behavioral;
