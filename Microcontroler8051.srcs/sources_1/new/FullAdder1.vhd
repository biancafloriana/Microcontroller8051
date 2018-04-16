----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:39:17 AM
-- Design Name: 
-- Module Name: FullAdder1 - Behavioral
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

entity FullAdder1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Rez : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FullAdder1;

architecture Structural of FullAdder1 is
signal AxorB : std_logic;
signal AandB : std_logic;
signal CinandAxorB : std_logic;
begin


Cout    <= (A and B) or (Cin and ( A xor B));

XOR_p_AB: entity WORK.XOR_P port map (
               A => A,
               B => B,
               O => AxorB);

XOR_p_ABCin: entity WORK.XOR_P port map (
               A => Cin,
               B => AxorB,
               O => Rez);

AND_p_AB: entity WORK.AND_P port map (
               A => A,
               B => B,
               O => AandB);
               
AND_p_AxorBCin: entity WORK.AND_P port map (
               A => AxorB,
               B => Cin,
               O => CinandAxorB);               

OR_p_Cout_O: entity WORK.OR_P port map (
               A => CinandAxorB,
               B => AandB,
               O => Cout);               
end Structural;
