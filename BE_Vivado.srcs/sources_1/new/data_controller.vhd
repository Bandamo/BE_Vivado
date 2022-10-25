----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2022 16:35:45
-- Design Name: 
-- Module Name: data_controller - Behavioral
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

entity data_controller is
    Port ( --unit : in STD_LOGIC_VECTOR (3 downto 0);
           --ten : in STD_LOGIC_VECTOR (3 downto 0);
           --hundred : in STD_LOGIC_VECTOR (3 downto 0);
           --thousand : in STD_LOGIC_VECTOR (3 downto 0);
           AN_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
end data_controller;

architecture Behavioral of data_controller is

signal unit : std_logic_vector(3 downto 0) := "0001";
signal ten : std_logic_vector(3 downto 0) := "0011";
signal hundred : std_logic_vector(3 downto 0) := "0111";
signal thousand : std_logic_vector(3 downto 0) := "1111";

begin

process(AN_in)
begin
case AN_in is
    when "11111110" => data_out <= unit;
    when "11111101" => data_out <= ten;
    when "11111011" => data_out <= hundred;
    when "11110111" => data_out <= thousand;
    when others => data_out <= "0000";
end case;


end process;

end Behavioral;
