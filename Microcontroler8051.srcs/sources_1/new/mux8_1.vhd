----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:50:54 AM
-- Design Name: 
-- Module Name: mux8_1 - Behavioral
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

entity mux8_1 is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           O : out STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (2 downto 0));
end mux8_1;

architecture Structural of mux8_1 is
signal muxO :std_logic_vector( 1 downto 0);
begin
Mux_I03: entity WORK.Mux4_1_1 port map(
            I => I(3 downto 0),
            Sel => Sel(1 downto 0),
            O => muxO(0));

Mux_I47: entity WORK.Mux4_1_1 port map(
            I => I(7 downto 4),
            Sel => Sel(1 downto 0),
            O => muxO(1));  
            
Mux_O: entity WORK.Mux2_1 port map(
                        I =>muxO,
                        Sel => Sel(2),
                        O => O);  

end Structural;
