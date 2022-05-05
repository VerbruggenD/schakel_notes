----------------------------------------------------------------------------------
-- Company: University Hasselt
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 17.03.2022 13:04:56
-- Design Name: XMas_Light
-- Module Name: RGB_select - Behavioral
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

entity RGB_select is
    Port ( Clk_in : in STD_LOGIC;
           cmd : in STD_LOGIC_VECTOR (31 downto 0);
           cmd_valid : in STD_LOGIC;
           RGB0_out : out STD_LOGIC_VECTOR (2 downto 0);
           RGB1_out : out STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC);
end RGB_select;

architecture Behavioral of RGB_select is

signal tick_s : std_logic;

signal RGB0_select_data : std_logic_vector(2 downto 0);
signal RGB1_select_data : std_logic_vector(2 downto 0);

signal RGB0_R_cmd : std_logic_vector(3 downto 0);
signal RGB0_G_cmd : std_logic_vector(3 downto 0);
signal RGB0_B_cmd : std_logic_vector(3 downto 0);
signal RGB1_R_cmd : std_logic_vector(3 downto 0);
signal RGB1_G_cmd : std_logic_vector(3 downto 0);
signal RGB1_B_cmd : std_logic_vector(3 downto 0);

component prescaler is
    generic ( divider : integer );
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end component;

component PWM is
    Port ( clk_in : in STD_LOGIC;
           tick_in : in STD_LOGIC;
           duty_in : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

begin

RGB0_select_data <= cmd(14 downto 12);
RGB1_select_data <= cmd(17 downto 15);

inst_prescalerPWM : prescaler
generic map ( divider => 10000 ) -- Door de simulatie factor die groot is, voor project moet die hoger
port map ( Clk_in => Clk_in,
           tick => tick_s,
           rst => reset );
           
inst_PWM_RGB0_R : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB0_R_cmd,
           output => RGB0_out(0),
           reset => reset );

inst_PWM_RGB0_G : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB0_G_cmd,
           output => RGB0_out(1),
           reset => reset );

inst_PWM_RGB0_B : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB0_B_cmd,
           output => RGB0_out(2),
           reset => reset );

inst_PWM_RGB1_R : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB1_R_cmd,
           output => RGB1_out(0),
           reset => reset );

inst_PWM_RGB1_G : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB1_G_cmd,
           output => RGB1_out(1),
           reset => reset );

inst_PWM_RGB1_B : PWM
port map ( Clk_in => Clk_in,
           tick_in => tick_s,
           duty_in => RGB1_B_cmd,
           output => RGB1_out(2),
           reset => reset );
           
process(Clk_in)
begin
    if Clk_in'event and Clk_in = '1' then
        if reset = '1' then
            RGB0_R_cmd <= "0000";
            RGB0_G_cmd <= "0000";
            RGB0_B_cmd <= "0000";
            RGB1_R_cmd <= "0000";
            RGB1_G_cmd <= "0000";
            RGB1_B_cmd <= "0000";
        else
            if cmd_valid = '1' then
                if RGB0_select_data(0) = '1' then
                    RGB0_R_cmd <= cmd(11 downto 8);
                end if;
                if RGB0_select_data(1) = '1' then
                    RGB0_G_cmd <= cmd(11 downto 8);
                end if;
                if RGB0_select_data(2) = '1' then
                    RGB0_B_cmd <= cmd(11 downto 8);
                end if;
                if RGB1_select_data(0) = '1' then
                    RGB1_R_cmd <= cmd(11 downto 8);
                end if;
                if RGB1_select_data(1) = '1' then
                    RGB1_G_cmd <= cmd(11 downto 8);
                end if;
                if RGB1_select_data(2) = '1' then
                    RGB1_B_cmd <= cmd(11 downto 8);
                end if;
            end if;
        end if;
    end if;
end process;

end Behavioral;
