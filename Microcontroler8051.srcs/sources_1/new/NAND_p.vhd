----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 10:21:09 AM
-- Design Name: 
-- Module Name: NAND_p - Behavioral
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

entity NAND_p is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           O : out STD_LOGIC);
end NAND_p;

architecture Structural of NAND_p is
signal AandB : std_logic;
begin
AND_P: entity WORK.AND_P port map(
            A => A,
            B => B,
            O => AandB);
            
NOT_p: entity WORK.NOT_p port map(
            A => AandB,
            O => O);            

end Structural;
