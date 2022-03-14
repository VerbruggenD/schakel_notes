----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 15:51:18
-- Design Name: 
-- Module Name: freq_gen - Behavioral
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

entity freq_gen is
    Port ( clk_in : in STD_LOGIC;
           freq_1hz_out : out STD_LOGIC;
           freq_2hz_out : out STD_LOGIC;
           freq_4hz_out : out STD_LOGIC;
           freq_8hz_out : out STD_LOGIC;
           reset : in STD_LOGIC);
end freq_gen;

architecture Behavioral of freq_gen is

signal tick_s : std_logic;
signal count : std_logic_vector(3 downto 0);

component prescaler is
    generic ( PRESCALER_MAX : integer );
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end component;

begin

freq_1hz_out <= count(3);
freq_2hz_out <= count(2);
freq_4hz_out <= count(1);
freq_8hz_out <= count(0);

inst_prescaler_freq_gen : prescaler
generic map ( PRESCALER_MAX => 125000000/12500000 )
port map ( clk_in => clk_in,
            tick => tick_s,
            rst => reset );
            
process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            count <= "0000";
        else
            if tick_s = '1' then
                count <= count + 1;
            end if;
        end if;
    end if;
end process;

end Behavioral;
