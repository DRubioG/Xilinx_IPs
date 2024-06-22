----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2024 08:20:27 PM
-- Design Name: 
-- Module Name: TIMER - arch_TIMER
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TIMER is
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
end TIMER;

architecture arch_TIMER of TIMER is

signal CASC : std_logic;
signal ENALL : std_logic;
signal PWMA : std_logic;
signal T_INT : std_logic;
signal ENT : std_logic;
signal ENIT : std_logic;
signal LOAD : std_logic;
signal ARHT : std_logic;
signal CAPT : std_logic;
signal GENT : std_logic;
signal UDT : std_logic;
signal MDT : std_logic;

signal cont : unsigned(WIDTH-1 downto 0);
signal load_aux : unsigned(WIDTH-1 downto 0);
signal generate_out : std_logic;

begin
    
    CASC    <= TCSR(11);
    ENALL   <= TCSR(10);
    PWMA    <= TCSR(9);
    T_INT   <= TCSR(8);
    ENT     <= TCSR(7);
    ENIT    <= TCSR(6);
    LOAD    <= TCSR(5);
    ARHT    <= TCSR(4);
    CAPT    <= TCSR(3);
    GENT    <= TCSR(2);
    UDT     <= TCSR(1);
    MDT     <= TCSR(0);
    
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            TCR <= (others=>'0');
            generateout <= '0';
        elsif rising_edge(clk) then
            TCR <= std_logic_vector(cont);
            generateout <= generate_out;
        end if;
    end process;
    
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            load_aux <= (others=>'0');
        elsif rising_edge(clk) then 
            if LOAD = '1' then
                load_aux <= unsigned(TLR);
            else
                load_aux <= load_aux;
            end if;
        end if;
    end process;
    
    
    
    
    process (clk, rst_n, load_aux)
    begin
        if rst_n = '0' then
            cont <= (others=>'0');
        elsif rising_edge(clk) then
            if ENT = '1' then
                if UDT = '0' then
                    if cont >= load_aux-1 then
                        cont <= (others=>'0');
                    else
                        cont <= cont +1;
                    end if;
                elsif UDT = '1' then
                    if cont = to_unsigned(0, cont'length) and cont > load_aux then
                        cont <= load_aux;
                    else
                        cont <= cont -1;
                    end if;
                end if;
            elsif ENT = '0' then
                cont <= (others=>'0');
            end if;
        end if;
    end process;
    
    
    
    process(clk, rst_n, T_INT)
    begin
        if rst_n = '0' then
            generate_out <= '0';
        elsif rising_edge(clk) then
            if UDT = '0' then
                if cont >= load_aux-1 then
                    if T_INT = '1' then
                        generate_out <= '1';
                    else 
                        generate_out <= '0';
                    end if;
                else
                    generate_out <= '0';
                end if;
            elsif UDT = '1' then
                if cont = to_unsigned(1, cont'length) then
                    if T_INT = '1' then
                        generate_out <= '1';
                    else 
                        generate_out <= '0';
                    end if;
                else
                    generate_out <= '0';
                end if;
            end if;
        end if;
    end process;
    
    
    

end arch_TIMER;
