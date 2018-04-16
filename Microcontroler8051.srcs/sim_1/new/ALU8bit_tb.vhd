----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 02:19:24 PM
-- Design Name: 
-- Module Name: ALU8bit_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU8bit_tb is
--  Port ( );
end ALU8bit_tb;

architecture Behavioral of ALU8bit_tb is
signal A : STD_LOGIC_VECTOR (7 downto 0);
signal B : STD_LOGIC_VECTOR (7 downto 0);
signal Op : STD_LOGIC_VECTOR (2 downto 0);
signal Rez : STD_LOGIC_VECTOR (7 downto 0);
signal CY : STD_LOGIC;
signal AC : STD_LOGIC;
signal OV : STD_LOGIC;
begin
 DUT: entity WORK.ALU8bit port map (
            A   => A,
            B   => B,
            Op  => Op,
            Rez => Rez,
            CY  => CY,
            AC  => AC,
            OV  => OV);
            
 gen_test:process
    begin
    for i in  0 to 7  loop  
            Op <= CONV_STD_LOGIC_VECTOR(i,3);           
            for x in  0 to 3 loop
                A <= CONV_STD_LOGIC_VECTOR(x,8);
                for y in  3 to 5 loop
                    B <= CONV_STD_LOGIC_VECTOR(y,8);
                end loop; 
            end loop;

     end loop;    
     wait; 
    end  process gen_test;          
end Behavioral;
