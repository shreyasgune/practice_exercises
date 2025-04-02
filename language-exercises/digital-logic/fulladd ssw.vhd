--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    15:11:47 03/31/10
-- Design Name:    
-- Module Name:    fulladd - Behavioral
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
-- to study full adder
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladd is
    Port ( a : in std_logic;
           b : in std_logic;
           c : in std_logic;
           s : out std_logic;
           carry : out std_logic);
end fulladd;

architecture Behavioral of fulladd is

begin
  s<= a xor (b xor c);
  carry<=(a and b) or (a and c) or (b and c);  


end Behavioral;
