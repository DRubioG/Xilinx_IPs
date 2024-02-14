----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2023 11:20:25 PM
-- Design Name: 
-- Module Name: SCU_TIMER - Behavioral
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

entity SCU_TIMER is
    generic(
        N : integer := 32);
    Port (
        clk : in std_logic;
        rst : in std_logic;
        Prescaler : in std_logic_vector(7 downto 0);
        Enable : in std_logic;
        Autoreload : in std_logic;
        Enable_int : in std_logic;
        Counter_reg : out std_logic_vector(N-1 downto 0);
        Int_Status_reg : out std_logic
    );

end SCU_TIMER;

architecture Behavioral of SCU_TIMER is
signal Int : std_logic;
signal En_count : std_logic;

component Preescaler is
    Port ( 
        clk, rst : in std_logic;
        En : in std_logic;
        Prescaler_value : in std_logic_vector(7 downto 0);
        Prescaler_out : out std_logic
    );
end component;

component Counter is
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
end component;



begin

impl_Counter: entity Counter
    generic map(
        N => N)
    port map(
        clk => clk,
        rst => rst,
        En => Enable,
        En_count => En_count,
        Int => Int,
        Autoreload => Autoreload,
        Counter_reg => Counter_reg);
        
impl_prescaler: entity Prescaler
    port map(
        clk => clk,
        rst => rst,
        En => Enable,
        Prescaler_value => Prescaler,
        Prescaler_out => En_count);
    
    

    Int_Status_reg <= Int and Enable_int;


end Behavioral;
