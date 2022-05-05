----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2022 13:09:29
-- Design Name: 
-- Module Name: communicator - Behavioral
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

entity communicator is
generic ( G_DATASIZE : integer := 256 );
port (  reset : in STD_LOGIC;
        clock : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
        data_in_valid : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
        data_out_valid : out STD_LOGIC;
        I2C_S_scl : in STD_LOGIC;
        I2C_S_sda : in STD_LOGIC;
        I2C_M_scl : out STD_LOGIC;
        I2C_M_sda : out STD_LOGIC );
end communicator;

architecture Behavioral of communicator is

signal I2C_S_scl_s : std_logic;
signal I2C_S_scl_s_ff : std_logic;
signal I2C_S_sda_s_ff : std_logic;
signal I2C_S_sda_s : std_logic;

component slave is
generic ( G_DATASIZE : integer := 256 );
port (  reset : in STD_LOGIC;
        clock : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
        data_out_valid : out STD_LOGIC;
        I2C_S_scl : in STD_LOGIC;
        I2C_S_sda : in STD_LOGIC );
end component;

component master is
    generic ( G_DATASIZE : integer := 256 );
    port (  reset : in STD_LOGIC;
            clock : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
            data_in_valid : in STD_LOGIC;
            I2C_M_scl : out STD_LOGIC;
            I2C_M_sda : out STD_LOGIC );
end component;

begin

inst_slave : slave
generic map ( G_DATASIZE => G_DATASIZE )
port map ( reset => reset,
            clock => clock,
            data_out => data_out,
            data_out_valid => data_out_valid,
            I2C_S_scl => I2C_S_scl_s,
            I2C_S_sda => I2C_S_sda_s );
            
inst_master : master
generic map ( G_DATASIZE => G_DATASIZE )
port map ( reset => reset,
            clock => clock,
            data_in => data_in,
            data_in_valid => data_in_valid,
            I2C_M_scl => I2C_M_scl,
            I2C_M_sda => I2C_M_sda );
            
FF1_scl : process (clock)
begin
if rising_edge(clock) then
    I2C_S_scl_s_ff <= I2C_S_scl;
end if;
end process;

FF2_scl : process (clock)
begin
if rising_edge(clock) then
    I2C_S_scl_s <= I2C_S_scl_s_ff;
end if;
end process;

FF1_sda : process (clock)
begin
if rising_edge(clock) then
    I2C_S_sda_s_ff <= I2C_S_sda;
end if;
end process;

FF2_sda : process (clock)
begin
if rising_edge(clock) then
    I2C_S_sda_s <= I2C_S_sda_s_ff;
end if;
end process;

end Behavioral;
