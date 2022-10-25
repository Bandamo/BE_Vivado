----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:39:51
-- Design Name: 
-- Module Name: Antibounce - Behavioral
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

entity Antibounce is
    Port ( bp_r : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           bp_s_r : out STD_LOGIC);
end Antibounce;

architecture Behavioral of Antibounce is

component FSM
    Port (
    bp_r_FSM : in STD_LOGIC;
           clk_FSM : in STD_LOGIC;
           rst_FSM : in STD_LOGIC;
           counter_end_FSM: in std_logic;
           bp_s_r_FSM : out STD_LOGIC;
           start_counter_FSM : out STD_LOGIC);
end component ;

component Counter
    Port  ( clk_Counter : in STD_LOGIC;
           rst_Counter : in STD_LOGIC;
           start_counter_Counter : in STD_LOGIC;
           counter_end_Counter : out STD_LOGIC);
end component ;

signal start_internal: std_logic;
signal end_internal: std_logic;

begin

FSM_int : FSM Port MAP(
    bp_r_FSM => bp_r,
    clk_FSM => clk,
    rst_FSM => rst,
    counter_end_FSM => end_internal,
    bp_s_r_FSM => bp_s_r,
    start_counter_FSM => start_internal
);

Counter_int : Counter Port MAP(
    clk_Counter => clk,
    rst_Counter => rst,
    start_counter_Counter => start_internal,
    counter_end_Counter => end_internal
);

end Behavioral;
