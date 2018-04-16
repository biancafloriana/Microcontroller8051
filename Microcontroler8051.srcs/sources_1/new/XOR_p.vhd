----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 10:12:08 AM
-- Design Name: 
-- Module Name: XOR_p - Behavioral
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

entity XOR_p is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           O : out STD_LOGIC);
end XOR_p;

architecture Structural of XOR_p is
signal AorB : std_logic;
signal AnandB : std_logic;
begin

OR_P: entity WORK.OR_P port map (
            A => A,
            B => B,
            O => AorB);

NAND_P: entity WORK.NAND_P port map (
            A => A,
            B => B,
            O => AnandB);

AND_P: entity WORK.AND_P port map (
            A => AorB,
            B => AnandB,
            O => O);


end Structural;
