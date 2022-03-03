----------------------------------------------------------------------------------
-- Company: UHasselt
-- Engineer: Dieter Verbruggen
-- 
-- Create Date: 03.03.2022 16:06:19
-- Design Name: xmas_light
-- Module Name: xmas_light_tb - Behavioral
-- Project Name: xmas_light
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xmas_light_tb is
end xmas_light_tb;

architecture Behavioural of xmas_light_tb is

  component xmas_light is
    port (
      reset : in STD_LOGIC;
      clock : in STD_LOGIC;
      command : in STD_LOGIC_VECTOR(31 downto 0);
      command_valid : in STD_LOGIC;
      RGB0 : out STD_LOGIC_VECTOR(2 downto 0);
      RGB1 : out STD_LOGIC_VECTOR(2 downto 0);
      LEDs : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  signal reset, clock : STD_LOGIC;
  signal command : STD_LOGIC_VECTOR(31 downto 0);
  signal command_valid : STD_LOGIC;
  signal RGB0 : STD_LOGIC_VECTOR(2 downto 0);
  signal RGB1 : STD_LOGIC_VECTOR(2 downto 0);
  signal LEDs : STD_LOGIC_VECTOR(3 downto 0);

  constant clock_period : time := 10 ns;

begin

  -------------------------------------------------------------------------------
  -- STIMULI
  -------------------------------------------------------------------------------
  PSTIM: process
  begin
    reset <= '1';
    command <= x"00000000";
    command_valid <= '0';
    wait for clock_period*10;

    reset <= '0';
    wait for clock_period*1000;
    
    --*************************************************************************

    -- turn on all LEDs
    command <= x"000000_F1";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate all LEDs at 1 Hz
    command <= x"000000_FC";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate all LEDs at 2 Hz
    command <= x"000000_FD";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate all LEDs at 4 Hz
    command <= x"000000_FE";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate all LEDs at 8 Hz
    command <= x"000000_FF";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    --*************************************************************************

    -- turn on LED(0)
    command <= x"000000_11";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off LED(0)
    command <= x"000000_10";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(0) at 1 Hz
    command <= x"000000_1C";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(0) at 2 Hz
    command <= x"000000_1D";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(0) at 4 Hz
    command <= x"000000_1E";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(0) at 8 Hz
    command <= x"000000_1F";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    --*************************************************************************

    -- turn on LED(1)
    command <= x"000000_21";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off LED(1)
    command <= x"000000_20";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(1) at 1 Hz
    command <= x"000000_2C";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(1) at 2 Hz
    command <= x"000000_2D";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(1) at 4 Hz
    command <= x"000000_2E";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(1) at 8 Hz
    command <= x"000000_2F";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

      -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;


    --*************************************************************************

    -- turn on LED(2)
    command <= x"000000_41";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off LED(2)
    command <= x"000000_40";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(2) at 1 Hz
    command <= x"000000_4C";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(2) at 2 Hz
    command <= x"000000_4D";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(2) at 4 Hz
    command <= x"000000_4E";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(0) at 8 Hz
    command <= x"000000_4F";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    --*************************************************************************
    
    -- turn on LED(3)
    command <= x"000000_81";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- turn off LED(3)
    command <= x"000000_80";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(3) at 1 Hz
    command <= x"000000_8C";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(3) at 2 Hz
    command <= x"000000_8D";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(3) at 4 Hz
    command <= x"000000_8E";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;

    -- oscillate LED(1) at 8 Hz
    command <= x"000000_8F";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;


    -- turn off all LEDs
    command <= x"000000_F0";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*1000;


    -- turn off all RGB LEDs
    command <= x"000_3F0_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_0 - PWM1
    command <= x"000_011_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_0 - PWM2
    command <= x"000_022_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_0 - PWM3
    command <= x"000_043_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_1 - PWM4
    command <= x"000_084_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_1 - PWM5
    command <= x"000_105_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_1 - PWM6
    command <= x"000_206_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_0 - PWM7
    command <= x"000_017_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_0 - PWM8
    command <= x"000_028_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_0 - PWM9
    command <= x"000_049_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_1 - PWMA
    command <= x"000_08A_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_1 - PWMB
    command <= x"000_10B_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_1 - PWMC
    command <= x"000_20C_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_0 - PWMD
    command <= x"000_01D_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_0 - PWME
    command <= x"000_02E_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_0 - PWMF
    command <= x"000_04F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_1 - PWMF
    command <= x"000_08F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_1 - PWMF
    command <= x"000_10F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on BLUE_1 - PWMF
    command <= x"000_20F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on RED_0 - PWMF
    command <= x"000_01F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    -- turn on GREEN_0 - PWME
    command <= x"000_02F_00";  command_valid <= '1';  wait for clock_period*4;
    command <= x"000_000_00";  command_valid <= '0';  wait for clock_period*4;
    wait for clock_period*10000;

    wait;
  end process;


  -------------------------------------------------------------------------------
  -- DEVICE UNDER TEST
  -------------------------------------------------------------------------------
  DUT: component xmas_light port map(
    reset => reset,
    clock => clock,
    command => command,
    command_valid => command_valid,
    RGB0 => RGB0,
    RGB1 => RGB1,
    LEDs => LEDs
  );

  
  -------------------------------------------------------------------------------
  -- CLOCK
  -------------------------------------------------------------------------------
  PCLK: process
  begin
    clock <= '1';
    wait for clock_period/2;
    clock <= '0';
    wait for clock_period/2;
  end process PCLK;

end Behavioural;
