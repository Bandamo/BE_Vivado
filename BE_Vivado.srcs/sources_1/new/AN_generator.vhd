----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 16:32:35
-- Design Name: 
-- Module Name: AN_generator - Behavioral
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

entity AN_generator is
    Port ( rst_an_generator : in STD_LOGIC;
           clk_an_generator : in STD_LOGIC;
           AN_generator_out : out std_logic_vector (7 downto 0));
end AN_generator;

architecture strl of AN_generator is

component clock_divider
    Port(
        clk_in : in STD_LOGIC;
        rst_in : in std_logic;
        clk_1kHz : out  STD_LOGIC);
end component;

component AN_counter
    Port ( rst_in : in STD_LOGIC;
           clk_in : in std_logic;
           clk_1kHz : in STD_LOGIC;
           AN_out : out std_logic_vector (7 downto 0));
end component;

signal clk_1kHz_internal : std_logic;

begin

AN_counter_component : AN_counter Port MAP(
    rst_in => rst_an_generator,
    clk_in => clk_an_generator,
    clk_1kHz => clk_1kHz_internal,
    AN_out => AN_generator_out
);

clock_divider_component : clock_divider Port MAP(
    clk_in => clk_an_generator,
    rst_in => rst_an_generator,
    clk_1kHz => clk_1kHz_internal
);

end strl;
