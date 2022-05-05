----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2022 13:09:29
-- Design Name: 
-- Module Name: slave - Behavioral
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

entity slave is
generic ( G_DATASIZE : integer := 256 );
port (  reset : in STD_LOGIC;
        clock : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
        data_out_valid : out STD_LOGIC;
        I2C_S_scl : in STD_LOGIC;
        I2C_S_sda : in STD_LOGIC );
end slave;

architecture Behavioral of slave is

type mystate is (reset_state, idle_state, read_state, stop_state);
signal state, next_state : mystate;

signal sda_last : std_logic;
signal scl_last : std_logic;
signal index : integer;

signal data_out_s : std_logic_vector(G_DATASIZE-1 downto 0);

begin

state_next : process(state, sda_last, I2C_S_sda, I2C_S_scl)
begin

    case state is
        when reset_state =>
            next_state <= idle_state;
            
        when idle_state =>
            if sda_last = '1' and I2C_S_sda = '0' and I2C_S_scl = '1' then
                next_state <= read_state;
            else
                next_state <= idle_state;
            end if;
            
        when read_state =>
            if sda_last = '0' and I2C_S_sda = '1' and I2C_S_scl = '1' then
                next_state <= stop_state;
            else
                next_state <= read_state;
            end if;
            
        when stop_state =>
            next_state <= idle_state;
            
        when others =>
            next_state <= reset_state;
    end case;
end process;

state_register : process(clock)
begin
    if clock'event and clock = '1' then
        if reset = '1' then
            state <= reset_state;
        else
            state <= next_state;
        end if;
        
        sda_last <= I2C_S_sda;
        scl_last <= I2C_S_scl;
        
    end if;
end process;

read_data : process(clock)
begin
    if rising_edge(clock) then
        if reset = '1' then
            index <= G_DATASIZE - 1;
            data_out_s <= (others => '0');
        else
            if state = read_state then
                if scl_last = '0' and I2C_S_scl = '1' then
                    if index >= 0 then
                        data_out_s(index) <= I2C_S_sda;
                        index <= index - 1;
                    end if;
                end if;
            else
                index <= G_DATASIZE - 1;
            end if;
        end if;
    end if;
end process;

out_process : process(state, data_out_s)
begin

    case state is
        when read_state =>
            data_out <= data_out_s;
            data_out_valid <= '0';
        
        when stop_state =>
            data_out <= data_out_s;
            data_out_valid <= '1';
        when others =>
            -- alles uit
            data_out <= (others => '0');
            data_out_valid <= '0';
    end case;

end process;

end Behavioral;
