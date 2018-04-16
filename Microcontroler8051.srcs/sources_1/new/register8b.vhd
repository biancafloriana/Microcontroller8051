----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 12:54:17 PM
-- Design Name: 
-- Module Name: register8b - Behavioral
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

entity register8b is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           O : out STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           En : in STD_LOGIC);
end register8b;

architecture Structural of register8b is
signal E : std_logic;
begin

AND_p_EnClk: entity WORK.AND_P port map (
               A => Clk,
               B => En,
               O => E);
               
Reg: FOR x IN 0 to 7 GENERATE
    d_l: entity WORK.d_latch port map(
                D => I(x),
                Clk => E,
                Rst => Rst,
                Q => O(x));             
    END GENERATE reg;

end Structural;
