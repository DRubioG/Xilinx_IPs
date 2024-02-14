----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 08:47:41 AM
-- Design Name: 
-- Module Name: AXI_Timer - Behavioral
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

entity AXI_Timer is
    generic(
        WIDTH_TIMER : integer := 8
    );
    Port ( 
        clk, rst    : in std_logic;
        freeze      : in std_logic;
        capturetrig0: in std_logic;
        capturetrig1: in std_logic;
        generateout0: out std_logic;
        generateout1: out std_logic;
        interrupt   : out std_logic;
        pwm0        : out std_logic;
        --TCSR0 
        CASC        : in std_logic;
        ENALL0      : in std_logic;
        PWMA0_0     : in std_logic;
        T0INT       : in std_logic;
        ENT0        : in std_logic;
        ENIT0       : in std_logic;
        LOAD0       : in std_logic;
        ARHT0       : in std_logic;
        CAPT0       : in std_logic;
        GENT0       : in std_logic;
        UDT0        : in std_logic;
        MDT0        : in std_logic;
        --TLR0 & TLR1 
        TLR0, TLR1  : out std_logic_vector(31 downto 0);
        --TCR0 & TCR1 
        TCR0, TCR1  : out std_logic_vector(31 downto 0);
        --TCSR1 
        ENALL1      : in std_logic;
        PWMA0_1     : in std_logic;
        T1INT       : in std_logic;
        ENT1        : in std_logic;
        ENIT1       : in std_logic;
        LOAD1       : in std_logic;
        ARHT1       : in std_logic;
        CAPT1       : in std_logic;
        GENT1       : in std_logic;
        UDT1        : in std_logic;
        MDT1        : in std_logic
    );
end AXI_Timer;

architecture Behavioral of AXI_Timer is

begin


end Behavioral;
