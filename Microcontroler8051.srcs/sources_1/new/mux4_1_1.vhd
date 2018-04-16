----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 11:03:00 AM
-- Design Name: 
-- Module Name: mux4_1_1 - Behavioral
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

entity mux4_1_1 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC);
end mux4_1_1;

architecture Structural of mux4_1_1 is
signal muxO : std_logic_vector(1 downto 0);

begin

Mux_I01: entity WORK.Mux2_1 port map(
            I => I(1 downto 0),
            Sel => Sel(0),
            O => muxO(0));

Mux_I23: entity WORK.Mux2_1 port map(
            I => I(3 downto 2),
            Sel => Sel(0),
            O => muxO(1));  
            
Mux_O: entity WORK.Mux2_1 port map(
                        I =>muxO,
                        Sel => Sel(1),
                        O => O);                       

end Structural;
