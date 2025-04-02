--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    10:53:58 04/09/10
-- Design Name:    
-- Module Name:    MULTIPLEXER - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--  implementation of multiplexer
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MULTIPLEXER is
    Port ( S1 : in std_logic;
           S2 : in std_logic;
           i0 : in std_logic;
           i1 : in std_logic;
           i2 : in std_logic;
           i3 : in std_logic;
           x : inout std_logic;
           y : inout std_logic;
           z : inout std_logic;
           w : inout std_logic;
           output : out std_logic);
end MULTIPLEXER;

architecture Behavioral of MULTIPLEXER is

begin
	 x<=(not s1 nand not s2 )nand i0;
	 y<=(not s1 nand s2) nand i1;
	 z<= (s1 nand  not s2) nand i2;
	 w<=(s1 nand s2) nand i3;
	 output<= (x nand y) nand (z nand w);

end Behavioral;
