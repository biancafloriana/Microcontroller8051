----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 01:08:06 PM
-- Design Name: 
-- Module Name: NAND_p3 - Structural
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

entity NAND_p3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           O : out STD_LOGIC);
end NAND_p3;

architecture Structural of NAND_p3 is
signal Int : std_logic;
begin
NAND_p1: entity WORK.NAND_P port map (
               A => A,
               B => B,
               O => Int);
               
NAND_p2: entity WORK.NAND_P port map (
                              A => Int,
                              B => C,
                              O => O);               

end Structural;
