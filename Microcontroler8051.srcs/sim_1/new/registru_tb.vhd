----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:37:58 PM
-- Design Name: 
-- Module Name: registru_tb - Behavioral
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

entity registru_tb is
--  Port ( );
end registru_tb;

architecture Behavioral of registru_tb is

signal  I :  STD_LOGIC_VECTOR (7 downto 0);
signal O :  STD_LOGIC_VECTOR (7 downto 0);
signal Clk :  STD_LOGIC:= '0';
signal Rst :  STD_LOGIC;
signal En :  STD_LOGIC:='0';
begin
    DUT: entity WORK.register8b port map(
                 I => I,
                 O => O,
                 Clk => Clk,
                 Rst =>  Rst,
                 En => En);

Clk <= not Clk after 10 ns;
gen_vectori: process
    begin
            Rst <= '1';
            wait for 20ns;
            Rst <= '0';
            wait for 20ns;
            I<= x"10";
            wait for 20ns;
            En<= '1';
            wait for 20ns;
            I <= x"23";
            wait for 20ns;
            I <= x"67";
            wait for 20ns; 
            En <= "0";
            I <= "x11";
            wait;
            
end Behavioral;

