----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2024 07:59:31 PM
-- Design Name: 
-- Module Name: AXI_TIMER - arch_AXI_TIMER
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

entity AXI_TIMER is
    generic (
        WIDTH : integer := 32
    );
    Port ( 
        clk : in std_logic;
        rst_n : in std_logic;
        
        freeze : in std_logic;
        capturetrig0 : in std_logic;
        capturetrig1 : in std_logic;
        generateout0 : out std_logic;
        generateout1 : out std_logic;
        pwm0        : out std_logic;
        interrupt : out std_logic;
        
        TCSR0 : in std_logic_vector(WIDTH-1 downto 0);
        TLR0 : in std_logic_vector(WIDTH-1 downto 0);
        TCR0 : out std_logic_vector(WIDTH-1 downto 0);
        TCSR1 : in std_logic_vector(WIDTH-1 downto 0);
        TLR1 : in std_logic_vector(WIDTH-1 downto 0);
        TCR1 : out std_logic_vector(WIDTH-1 downto 0)
    );
end AXI_TIMER;

architecture arch_AXI_TIMER of AXI_TIMER is

component TIMER is
    generic(
        WIDTH : integer := 32
    );
    Port ( 
        clk : in std_logic;
        rst_n : in std_logic;
        capturetrig : in std_logic;
        generateout : out std_logic;
        TCSR: in std_logic_vector(WIDTH-1 downto 0);
        TLR : in std_logic_vector(WIDTH-1 downto 0);
        TCR : out std_logic_vector(WIDTH-1 downto 0)
    );
end component;

begin

impl_TIMER0:  TIMER 
    generic map (
        WIDTH => WIDTH
    )
    Port map( 
        clk => clk,
        rst_n => rst_n,
        capturetrig => capturetrig0,
        generateout => generateout0,
        TCSR => TCSR0,
        TLR => TLR0,
        TCR => TCR0
    );


impl_TIMER1:  TIMER 
    generic map (
        WIDTH => WIDTH
    )
    Port map( 
        clk => clk,
        rst_n => rst_n,
        capturetrig => capturetrig1,
        generateout => generateout1,
        TCSR => TCSR1,
        TLR => TLR1,
        TCR => TCR1
    );


end arch_AXI_TIMER;
