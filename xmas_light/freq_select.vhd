----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 14:49:46
-- Design Name: 
-- Module Name: freq_select - Behavioral
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

entity freq_select is
    Port ( clk_in : in STD_LOGIC;
           freq_1hz_in : in STD_LOGIC;
           freq_2hz_in : in STD_LOGIC;
           freq_4hz_in : in STD_LOGIC;
           freq_8hz_in : in STD_LOGIC;
           freq_cmd : in STD_LOGIC_VECTOR (1 downto 0);
           freq_out : out STD_LOGIC;
           reset : in STD_LOGIC );
end freq_select;

architecture Behavioral of freq_select is

begin

freq_select : process(clk_in)
begin
    if clk_in'event and clk_in = '1' then
        if reset = '1' then
            freq_out <= '0';
        else
            case freq_cmd is
                when "00" =>
                    freq_out <= freq_1hz_in;
                when "01" =>
                    freq_out <= freq_2hz_in;
                when "10" =>
                    freq_out <= freq_4hz_in;
                when "11" =>
                    freq_out <= freq_8hz_in;
                when others =>
                    freq_out <= '0';
            end case;
        end if;
    end if;
end process;

end Behavioral;
