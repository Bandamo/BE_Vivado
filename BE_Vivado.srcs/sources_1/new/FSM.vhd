----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:42:23
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    Port ( bp_r_FSM : in STD_LOGIC;
           clk_FSM : in STD_LOGIC;
           rst_FSM : in STD_LOGIC;
           counter_end_FSM: in std_logic;
           bp_s_r_FSM : out STD_LOGIC;
           start_counter_FSM : out STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

type etats is (attenteO, tempoI, attenteI, tempoO);
signal etatP, etatF : etats;

signal start_counter_internal : std_logic;
begin

F : process(etatP, bp_r_FSM)
begin
    case etatP is
        when attenteO => if bp_r_FSM = '1' then
            etatF <= tempoI;
            else etatF <= attenteO;
            end if;
        when tempoI => if counter_end_FSM = '1' then
            etatF <= attenteI;
            else etatF <= tempoI;
            end if; 
        when attenteI => if bp_r_FSM = '0' then
            etatF <= tempoO;
            else etatF <= attenteI;
            end if;
        when tempoO => if counter_end_FSM = '1' then
            etatF <= attenteO;
            else etatF <= tempoO;
            end if;
    end case;
end process;

M : process(rst_FSM, clk_FSM)
begin
    if rst_FSM = '1' then
        etatP <= attenteO;
    elsif rising_edge(clk_FSM) then
        etatP<=etatF;
    end if;
end process;

start_counter_FSM <= '1' when (etatP = tempoO or etatP = tempoI) else '0';
bp_s_r_FSM <= '1' when (etatP = tempoI or etatP = attenteI) else '0';

end Behavioral;
