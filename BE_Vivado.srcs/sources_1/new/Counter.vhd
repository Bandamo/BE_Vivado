----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:46:49
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( clk_Counter : in STD_LOGIC;
           rst_Counter : in STD_LOGIC;
           start_counter_Counter : in STD_LOGIC;
           counter_end_Counter : out STD_LOGIC);
end Counter;

architecture Behavioral of Counter is

signal count : integer;

begin
process(clk_Counter, rst_counter, start_counter_Counter)
begin
if rst_Counter='1' then
    count <= 0;
    
end if;

if rising_edge(clk_Counter) then
    if start_counter_Counter = '1' then
        counter_end_Counter <= '0';
    end if;
    --Horloge à 100MHz donc 200000 coups pour 2ms
    if count >= 200000 then
        counter_end_Counter <= '1';
        count <= 0;
    else
        count <= count+1;
    end if;
end if;

end process;


end Behavioral;
