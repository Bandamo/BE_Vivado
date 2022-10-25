----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2022 17:12:35
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( rst : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           BCD : out STD_LOGIC_VECTOR (6 downto 0);
           DP : in std_logic;
           DPS: out std_logic);
end top_level;

architecture strl of top_level is

component data_controller
    Port ( --unit : in STD_LOGIC_VECTOR (3 downto 0);
           --ten : in STD_LOGIC_VECTOR (3 downto 0);
           --hundred : in STD_LOGIC_VECTOR (3 downto 0);
           --thousand : in STD_LOGIC_VECTOR (3 downto 0);
           AN_in  : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
end component ;

component BCD_decoder
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           dp_int : in STD_LOGIC;
           BCD_out : out std_logic_vector (6 downto 0);
           dps_out : out std_logic);
end component;

component AN_generator
    Port ( rst_an_generator : in STD_LOGIC;
           clk_an_generator : in STD_LOGIC;
           AN_generator_out : out std_logic_vector(7 downto 0));
end component;
    

signal internal: std_logic_vector(3 downto 0);
signal AN_internal: std_logic_vector(7 downto 0);

begin

data_control : data_controller Port MAP(
    AN_in => AN_internal,
    data_out => internal
);

BCD_deco : BCD_decoder Port MAP(
    data_in => internal,
    dp_int => DP,
    BCD_out => BCD,
    dps_out => DPS
);

AN_generator_component : AN_generator Port MAP(
    rst_an_generator => rst,
    clk_an_generator => clk,
    AN_generator_out => AN_internal
);

AN <= AN_internal;

end strl;
