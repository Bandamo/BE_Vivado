----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 09:25:16
-- Design Name: 
-- Module Name: AN_counter - Behavioral
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

entity AN_counter is
    Port ( rst_in : in STD_LOGIC;
           clk_in : in std_logic;
           clk_1kHz : in STD_LOGIC;
           AN_out : out std_logic_vector (7 downto 0));
end AN_counter;

architecture Behavioral of AN_counter is

signal AN_internal : std_logic_vector(7 downto 0);

begin


process(clk_in,rst_in)
begin
    if rising_edge(clk_in) then
        if rst_in = '1' then
            AN_internal <= "11111110";
        elsif clk_1kHz = '1' then
            case AN_internal is
                when "11111110" => AN_internal <= "11111101";
                when "11111101" => AN_internal <= "11111011";
                when "11111011" => AN_internal <= "11110111";
                when "11110111" => AN_internal <= "11101111";
                when "11101111" => AN_internal <= "11011111";
                when "11011111" => AN_internal <= "10111111";
                when "10111111" => AN_internal <= "01111111";
                when "01111111" => AN_internal <= "11111110";
                when others => AN_internal <= "00000000";
            end case;
         else
            AN_internal <= AN_internal;
        end if;
    end if;
end process;

AN_out <= AN_internal;

end Behavioral;
