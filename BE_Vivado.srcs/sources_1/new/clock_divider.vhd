----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 09:25:16
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
    Port (
        clk_in : in STD_LOGIC;
        rst_in : in std_logic;
        clk_1kHz : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal counter : integer;

begin
process(clk_in, rst_in)
begin
if rst_in ='1' then
    counter <= 0;
    clk_1kHz <= '0';

elsif rising_edge(clk_in) then
    if counter = 100000 then
        clk_1kHz <= '1';
        counter <=0;
     else
        clk_1kHz <= '0';
        counter <= counter+1;
        
     
    end if;
end if;



end process;


end Behavioral;
