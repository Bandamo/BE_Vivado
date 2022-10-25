----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2022 08:50:58 AM
-- Design Name: 
-- Module Name: BCD_decoder - Behavioral
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

entity BCD_decoder is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           dp_int : in STD_LOGIC;
           BCD_out : out std_logic_vector (6 downto 0);
           dps_out : out std_logic);
end BCD_decoder;

architecture Behavioral of BCD_decoder is

begin

process(data_in)
begin

case data_in is
    when "0000" => BCD_out <= "1000000";
    when "0001" => BCD_out <= "1111001";
    when "0010" => BCD_out <= "0100100";
    when "0011" => BCD_out <= "0110000";
    when "0100" => BCD_out <= "0011001";
    when "0101" => BCD_out <= "0010010";
    when "0110" => BCD_out <= "0000010";
    when "0111" => BCD_out <= "1111000";
    when "1000" => BCD_out <= "0000000";
    when "1001" => BCD_out <= "0010000";
    when "1010" => BCD_out <= "0001000";
    when "1011" => BCD_out <= "0000011";
    when "1100" => BCD_out <= "1000110";
    when "1101" => BCD_out <= "0100001";
    when "1110" => BCD_out <= "0000110";
    when "1111" => BCD_out <= "0001110";
end case;

end process;

dps_out <=dp_int;

end Behavioral;
