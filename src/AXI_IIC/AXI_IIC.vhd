library ieee;
use ieee.std_logic_1164.all;

entity axi_iic is
    port(
        s_axi_aclk : in std_logic;
        s_axi_aresetn : in std_logic;
        iic2intc_irpt : out std_logic;
        --s_axi
        sda_i : in std_logic;
        sda_o : out std_logic;
        sda_t : out std_logic;
        scl_i : in std_logic;
        scl_o : out std_logic;
        scl_t : out std_logic;
        gpo : out std_logic
    );
end entity;