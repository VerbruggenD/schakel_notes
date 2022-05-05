----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 13:46:56
-- Design Name: 
-- Module Name: master - Behavioral
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

entity master is
    generic ( G_DATASIZE : integer := 256 );
    port (  reset : in STD_LOGIC;
            clock : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(G_DATASIZE-1 downto 0);
            data_in_valid : in STD_LOGIC;
            I2C_M_scl : out STD_LOGIC;
            I2C_M_sda : out STD_LOGIC );
end master;

architecture Behavioral of master is

component prescaler is
    generic ( divider : integer );
    Port ( clk_in : in STD_LOGIC;
           tick : out STD_LOGIC;
           rst : in std_logic);
end component;

type mystate is (reset_state, idle_state, start_state ,startbit_state, write_state, stop_state, stopbit_state);
signal state, next_state : mystate;

signal index : integer := 0;
signal tick_s : std_logic;
signal scl_s : std_logic;
signal scl_last : std_logic;
signal presc_rst : std_logic;

begin

inst_prescaler : prescaler
    generic map ( divider => 200000 )
    port map ( clk_in => clock,
                tick => tick_s,
                rst => presc_rst );

state_next : process(state, index, data_in_valid, tick_s, scl_s)
begin
    case state is
        when reset_state =>
            next_state <= idle_state;
        
        when idle_state =>
            if data_in_valid = '1' then
                next_state <= start_state;
            else
                next_state <= idle_state;
            end if;
            
        when start_state =>
            next_state <= startbit_state;
            
        when startbit_state =>
            if tick_s = '1' then
                next_state <= write_state;
            else
                next_state <= startbit_state;
            end if;
            
        when write_state =>
            if index = -1 and scl_last = '1' and scl_s = '0' then
                next_state <= stop_state;
            else
                next_state <= write_state;
            end if;
            
        when stop_state =>
            if tick_s = '1' and scl_s = '1' then
                next_state <= idle_state;
            end if;
        
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
        
        scl_last <= scl_s;
        
    end if;
end process;

scl_process : process(clock)
begin

    if rising_edge(clock) then
        case state is
            when startbit_state =>
                if tick_s = '1' then
                    scl_s <= not scl_s;
                end if;
        
            when write_state =>
                if tick_s = '1' then
                    scl_s <= not scl_s;
                end if;
                
             when stop_state =>
                if tick_s = '1' and scl_s = '0' then
                    scl_s <= not scl_s;
                end if;
        
            when others =>
                scl_s <= '1'; 
        end case;
    end if;
end process;

write_process : process(clock)
begin
    if rising_edge(clock) then
        case state is
            when startbit_state =>
                I2C_M_sda <= '0';
                index <= G_DATASIZE -1;
        
            when write_state =>
                if scl_last = '1' and scl_s = '0' then
                    if index >= 0 then
                        I2C_M_sda <= data_in(index);
                        index <= index -1;
                    end if;
                end if;
                
            when stop_state =>
                I2C_M_sda <= '0';
                
            when others =>
                index <= G_DATASIZE -1;
                I2C_M_sda <= '1';
        end case;
    end if;
end process;

out_process : process(state)
begin
    case state is
        when start_state =>
            presc_rst <= '1';
            
        when reset_state =>
            presc_rst <= '1';
            
        when others =>
            presc_rst <= '0';
    end case;
end process;

I2C_M_scl <= scl_s;

end Behavioral;
