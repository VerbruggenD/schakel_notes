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
           led_r : out std_logic;
           led_g : out std_logic;
           led_b : out std_logic;
           reset_btn : in STD_LOGIC);
end toplevel;

architecture Behavioral of toplevel is

signal tick_state_s : std_logic;

signal tick_pwm_s : std_logic;
signal pwm_25_s : std_logic;
signal pwm_50_s : std_logic;
signal output_s : std_logic_vector(2 downto 0);

component prescaler is
    generic ( PRESCALER_MAX : integer );
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end component;

component state_mach is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           pwm_25 : in STD_LOGIC;
           pwm_50 : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC);
end component;

component pwm is
Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           out_d25 : out STD_LOGIC;
           out_d50 : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

begin

led_r <= output_s(0);
led_g <= output_s(1);
led_b <= output_s(2);

inst_prescaler_pwm : prescaler
generic map ( PRESCALER_MAX => 125000000/125000000)
port map ( clk_in => clk,
            tick => tick_pwm_s,
            rst => reset_btn );

inst_prescaler_state : prescaler
generic map ( PRESCALER_MAX => 125000000/1000000)
port map ( clk_in => clk,
            tick => tick_state_s,
            rst => reset_btn );

inst_state_mach : state_mach
port map ( clk_in => clk,
           tick_in => tick_state_s,
           pwm_25 => pwm_25_s,
           pwm_50 => pwm_50_s,
           output => output_s,
           reset => reset_btn );

inst_pwm : pwm
port map ( clk_in => clk,
           tick_in => tick_pwm_s,
           out_d25 => pwm_25_s,
           out_d50 => pwm_50_s,
           reset => reset_btn );

end Behavioral;
