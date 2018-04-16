----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:37:44 AM
-- Design Name: 
-- Module Name: ALU1b - Behavioral
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

entity ALU1b is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           Rez : out STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end ALU1b;

architecture Structural of ALU1b is
signal Ainvert:std_logic:= '0';
signal A_mux: std_logic;
signal muxAin: std_logic_vector(1 downto 0);
signal Binvert:std_logic;
signal B_mux: std_logic;
signal muxBin: std_logic_vector(1 downto 0);
signal MUX: std_logic_vector(7 downto 0);
signal notA: std_logic;
signal notB: std_logic;
begin

Binvert <= Op(2);
A_invert: entity WORK.NAND_p3 port map (
            A => Op(1),
            B => Op(2),
            C => Op(0),
            O => Ainvert);

NOT_pA:     entity WORK.NOT_P port map ( 
                    A => A,
                    O => notA);
                    
muxAin <= not A & A;
Amux:      entity Work.Mux2_1 port map (
                   I    => muxAin,
                   Sel  => Ainvert,
                   O    => A_mux);

NOT_pB:    entity WORK.NOT_P port map ( 
                   A => B,
                   O => notB);
                    
muxBin <= B & not B;
Bmux:      entity Work.Mux2_1 port map (
                    I    => muxBin,
                    Sel  => ainvert,
                    O    => B_mux);
-- a and b   a nor b  M0      
AND_p:     entity WORK.AND_P port map (
                     A => A_mux,
                     B => B_mux,
                     O => MUX(6));
Mux(0) <= MUX(6);                     
-- a or b M1
OR_p:      entity WORK.OR_P port map (
                     A => A_mux,
                     B => B_mux,
                     O => MUX(7));
-- a+b a-b M2
full_adder:       entity WORK.FULLAdder1 port map(
                    Cin => Cin,
                    A   => A_mux,
                    B   => B_mux,
                    Rez => Mux(5),
                    Cout=> Cout);
Mux(1) <= Mux(5);                    
-- a xor b M3
XOR_p:   entity WORK.XOR_P port map (
                    A => A,
                    B => B,
                    O => MUX(4));   
-- not A M4
MUX(2) <= notA;
MUX(3) <= '0';   
MUX_Op: entity WORK.Mux8_1 port map(
                        I =>MUX,
                        Sel => Op,
                        O => Rez);  

              
end Structural;
