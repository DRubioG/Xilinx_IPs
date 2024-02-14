----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 07:50:48 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    generic(
        N : integer := 32
    ); 
    Port ( 
        clk, rst : in std_logic;
        En : in std_logic;
        En_count : in std_logic;
        Int : out std_logic;
        Autoreload : in std_logic;
        Counter_reg : out std_logic_vector(N-1 downto 0)
    );
end Counter;

architecture Behavioral of Counter is

begin


end Behavioral;
