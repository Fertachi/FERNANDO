library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory_test is
    Port (
		  data_in 		: in std_logic_vector(7 downto 0);
		  writen 		: in std_logic;
        reset 			: in std_logic;
		  clk   			: in std_logic;
		  port_in_00 	: in std_logic_vector(7 downto 0);
        port_in_01 	: in std_logic_vector(7 downto 0);
        address 		: in std_logic_vector(7 downto 0);
        display_4    : out std_logic_vector(6 downto 0);
        display_3    : out std_logic_vector(6 downto 0);
        display_2    : out std_logic_vector(6 downto 0);
        display_1    : out std_logic_vector(6 downto 0)
    );
end memory_test;

architecture memory_test_arq of memory_test is
    
    component memory is
        port
        (
            address         : in std_logic_vector (7 downto 0);
            data_in         : in std_logic_vector (7 downto 0);
            writen          : in std_logic;
            clk             : in std_logic;
            reset           : in std_logic;
            port_in_00      : in std_logic_vector (7 downto 0);
            port_in_01      : in std_logic_vector (7 downto 0);
            port_out_00     : out std_logic_vector (7 downto 0);
            port_out_01     : out std_logic_vector (7 downto 0);
            data_out        : out std_logic_vector (7 downto 0)
        );
    end component;

    component bcd is
        port 
        (
            BCD_in      : in STD_LOGIC_VECTOR (3 downto 0);
            Segments    : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal data_out_memory : std_logic_vector(7 downto 0);
    
begin
    U1: memory port map(
        address => address,
        data_in => data_in,
        writen => writen,
        clk => clk,
        reset => reset,
        port_in_00 => port_in_00,
        port_in_01 => port_in_01,
        port_out_00 => open, 
        port_out_01 => open, 
        data_out => data_out_memory
    );

    
    U2: bcd port map(
        BCD_in => address(3 downto 0),
        Segments => display_1
    );
    
    U3: bcd port map(
        BCD_in => address(7 downto 4), 
        Segments => display_2
    );

    U4: bcd port map(
        BCD_in => data_out_memory(3 downto 0), 
        Segments => display_3
    );

    U5: bcd port map(
        BCD_in => data_out_memory(7 downto 4), 
        Segments => display_4
    );
    
end memory_test_arq;