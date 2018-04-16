----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 12:54:17 PM
-- Design Name: 
-- Module Name: d_latch - Behavioral
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

entity d_latch is
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Q : out STD_LOGIC);
end d_latch;

architecture Behavioral of d_latch is
signal S : std_logic;
signal R : std_logic;
signal DnandRst : std_logic;
signal P1: std_logic;
signal P4: std_logic;
signal Qs: std_logic;
signal NQs: std_logic;
begin

NAND_p_1: entity WORK.NAND_P port map (
               A => S,
               B => DnandRst,
               O => P1);

NAND_p3_2: entity WORK.NAND_P3 port map (
               A => Clk,
               B => Rst,
               C => P1,
               O => S);
NAND_p3_3: entity WORK.NAND_P3 port map (
               A => S,
               B => Clk,
               C => P4,
               O => R);
                              
NAND_p3_4: entity WORK.NAND_P3 port map (
                              A => R,
                              B => D,
                              C => Rst,
                              O => P4);                   

NAND_p_5: entity WORK.NAND_P port map (
               A => S,
               B => NQs,
               O => Qs);

NAND_p_6: entity WORK.NAND_P port map (
               A => R,
               B => Qs,
               O => NQs); 
                                            
Q   <= Qs;

end Behavioral;
