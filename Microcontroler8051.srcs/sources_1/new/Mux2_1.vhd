----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:50:54 AM
-- Design Name: 
-- Module Name: Mux2_1 - Behavioral
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

entity Mux2_1 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC;
           Sel : in STD_LOGIC);
end Mux2_1;

architecture Structural of Mux2_1 is
signal I0nandS: std_logic;
signal I1nandnS: std_logic;
signal notSel: std_logic;
begin

NAND_p_I0A:     entity WORK.NAND_P port map (
                    A => I(0),
                    B => Sel,
                    O => I0nandS);
  
NOT_pA:         entity WORK.NOT_P port map ( 
                    A => Sel,
                    O => notSel);
                      
NAND_p_I1nA:    entity WORK.NAND_P port map (
                    A => I(1),
                    B => notSel,
                    O => I1nandnS);

NAND_p_O:       entity WORK.NAND_P port map (
                    A => I0nandS,
                    B => I1nandnS,
                    O => O);


end Structural;
