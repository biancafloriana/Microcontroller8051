----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:17:07 PM
-- Design Name: 
-- Module Name: test1 - Behavioral
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

entity test1 is
--  Port ( );
end test1;

architecture Behavioral of test1 is
signal  I :  STD_LOGIC_VECTOR (7 downto 0);
signal O :  STD_LOGIC_VECTOR (7 downto 0);
signal Clk :  STD_LOGIC;
signal Rst :  STD_LOGIC;
signal En :  STD_LOGIC;
begin
    DUT: entity WORK.register8b port map(
                 I => I,
                 O => O,
                 Clk => Clk,
                 Rst =>  Rst,
                 En => En);

end Behavioral;
