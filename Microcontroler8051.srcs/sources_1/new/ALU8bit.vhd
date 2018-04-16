----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2018 04:33:55 PM
-- Design Name: 
-- Module Name: ALU8bit - Behavioral
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

entity ALU8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           Rez : out STD_LOGIC_VECTOR (7 downto 0);
           CY : out STD_LOGIC;
           AC : out STD_LOGIC;
           OV : out STD_LOGIC);
end ALU8bit;

architecture Structural of ALU8bit is

signal Cout: std_logic_vector(7 downto 0);

begin

ALU_0: entity WORK.ALU1b port map(
                A   => A(0),
                B   => B(0),
                Cin => '0',
                Op  => Op,
                Rez => Rez(0),
                Cout => Cout(0));

ALU_1: entity WORK.ALU1b port map(
                A   => A(1),
                B   => B(1),
                Cin => Cout(0),
                Op  => Op,
                Rez => Rez(1),
                Cout => Cout(1));
                
ALU_2: entity WORK.ALU1b port map(
               A   => A(2),
               B   => B(2),
               Cin => Cout(1),
               Op  => Op,
               Rez => Rez(2),
               Cout => Cout(2));
               
ALU_3: entity WORK.ALU1b port map(
               A   => A(3),
               B   => B(3),
               Cin => Cout(2),
               Op  => Op,
               Rez => Rez(3),
               Cout => Cout(3));  
               
ALU_4: entity WORK.ALU1b port map(
               A   => A(4),
               B   => B(4),
               Cin => Cout(3),
               Op  => Op,
               Rez => Rez(4),
               Cout => Cout(4)); 

ALU_5: entity WORK.ALU1b port map(
               A   => A(5),
               B   => B(5),
               Cin => Cout(4),
               Op  => Op,
               Rez => Rez(5),
               Cout => Cout(5));
               
ALU_6: entity WORK.ALU1b port map(
               A   => A(6),
               B   => B(6),
               Cin => Cout(5),
               Op  => Op,
               Rez => Rez(6),
               Cout => Cout(6)); 
               
ALU_7: entity WORK.ALU1b port map(
               A   => A(7),
               B   => B(7),
               Cin => Cout(6),
               Op  => Op,
               Rez => Rez(7),
               Cout => Cout(7));               
        
CY_O: CY <= Cout(7);
              
XOR_p_OV_O: entity WORK.XOR_P port map (
               A => Cout(7),
               B => Cout(6),
               O => OV);
               
AC_O:   AC <= Cout(3);               
                
end Structural;
