--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    11:11:23 04/09/10
-- Design Name:    
-- Module Name:    fulladder - Behavioral
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
--   implementation of  fulladder
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder is
    Port ( a : in std_logic;
           b : in std_logic;
           c : in std_logic;
           sum  : out std_logic;
           carry : out std_logic);
end fulladder;

architecture Behavioral of fulladder is

begin
  sum<=(a xor b) xor c;
  carry<=((a and b) or (a and c)) or (b and c); 

end Behavioral;
