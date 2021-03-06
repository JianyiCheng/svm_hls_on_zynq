-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity svm_classifier_SVs_h_V_8_rom is 
    generic(
             dwidth     : integer := 240; 
             awidth     : integer := 5; 
             mem_size    : integer := 29
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of svm_classifier_SVs_h_V_8_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "000101011011110001000010000011111111000111101111110001101001111110001101100111101110001111111101111011011000011000011101000110011011010000000110110111111110001101110000000111001101000010110111110111111110000010000010011000000111111111100111", 
    1 => "000111111010001000011100101011111100100001100111111111011000000010000011110111010101111000111101111011011111110000001010000100111101000000111101110111111100001111011111111000100100111111010101011111101110001000111100010101000111111111100111", 
    2 => "000000011111001111010001111011111001111011011111100011111010001001110000001000000110100110000111100110000111100010101111000111111001101111000010000110001000000101101111011011010011000001000110101111011110001110000001001010101111011110000101", 
    3 => "000000011111001001000010000011000001101101110111110001101001111110001101100111111010011010111101111011011111111101100110000011011110101111111001000111000010001010100111101001111100111011110011000111011110001110111101100010011111101110110110", 
    4 => "000010111101100000000011110000111111000111101111111111011000000011111110111111101110001111111100010100011000011000011101111111000011110111111001000111111100001111011000010101110101111111010101011111111110000010111111111101001111101110110110", 
    5 => "000010111101100001000010000011000001101101110111010110001010000000001000101111111010011010111101111011011000011000011101111100000111001000000110110111000010001010100000010101110101111111010101011111111110000010111111111101001111111111100111", 
    6 => "111011100010100111101010110110000001101101110111111111011000000010000011110000101011001000000100010111110000011000011101000000100010000000000110110111111010010001000111101001111100111011110011000111111110000010111100010101000111111111100111", 
    7 => "000000011111001111101010110110111111000111101111010110001010000101111001111111001001101100111111100010100000110011010100111010101000110111001111110110111110001101110111101001111100111111010101011111111110000010111111111101001111101110110110", 
    8 => "111011100010100111011110011000111001111011011111100011111010001001110000001000000110100110001010110100001000001011000001000000100010000111001111110110000010001010100111101001111100000001000110101000001101111100000001001010101000010000011000", 
    9 => "111110000000110111011110011000000110111010000111110001101001000000001000101000110111010100111101111011011000001011000001111101100101011000111101110111000000001100001111101001111100111011110011000111101110001000111000101100110111101110110110", 
    10 => "000101011011110000010000001110111100100001100111111111011000000010000011110111101110001111000100010111110000100101111000111100000111001111101011010110000100001000111000010101110101000010110111110000011101110110000010011000000000010000011000", 
    11 => "111011100010100000101001001000000001101101110000101000100110000010000011110111111010011010111100010100011111110000001010111101100101011000000110110111000000001100001000010101110101111101100100010111111110000010111110101111110111101110110110", 
    12 => "000000011111001000110101100110111111000111101111010110001010000000001000101111111010011010000001001001101010000011111001111111000011110111111001000111000000001100001111111000100100000100101001000000001101111100111101100010011000010000011000", 
    13 => "111011100010100111011110011000111100100001100111010110001010000010000011110110111101100001110111011111001000100101111000111010101000110111011101100110111000010010101111111000100100000001000110101111111110000010000001001010101111101110110110", 
    14 => "000000011111001111011110011000000100010011111111110001101001000010000011110000110111010100111100010100011111110000001010111101100101011000111101110111000000001100001111101001111100111111010101011111111110000010111111111101001111101110110110", 
    15 => "000000011111001000101001001000111100100001100111111111011000000011111110111000000110100110111100010100011000100101111000111101100101011111111001000111000000001100001000000111001101000001000110101111111110000010000001001010101111101110110110", 
    16 => "001100110110110000110101100110111111000111101111111111011000000011111110111111100010000011000100010111110111110000001010000000100010000111101011010110000100001000111111101001111100111111010101011111011110001110000011100101011111111111100111", 
    17 => "000000011111001111011110011000001001100000001111110001101001000000001000101000110111010100111101111011011000001011000001111101100101011000111101110111000000001100001111111000100100000001000110101111101110001000000001001010101111011110000101", 
    18 => "111110000000110111011110011000000001101101110111111111011000000010000011110000101011001000111100010100011000100101111000000000100010000000000110110111111110001101110111101001111100111011110011000111111110000010111101100010011111111111100111", 
    19 => "000000011111001000110101100110000001101101110111110001101001000000001000101111111010011010111101111011011111111101100110000011011110101111111001000111000000001100001111111000100100000001000110101111011110001110000001001010101111011110000101", 
    20 => "000111111010001000011100101011111100100001100111110001101001000000001000101111100010000011111101111011011111100010101111000100111101000000110000000111111100001111011111111000100100111111010101011111111110000010111011000111100111111111100111", 
    21 => "000000011111001111010001111011111001111011011111100011111010001001110000001111111010011010000111100110000111110000001010000111111001101110110100010110001010000100000111011011010011000010110111110111101110001000000010011000000111101110110110", 
    22 => "000010111101100000101001001000111111000111101111010110001010000111110101000111111010011010111101111011011000100101111000000000100010000000000110110111111100001111011111011011010011111000010000110111001110010101110111011111011111011110000101", 
    23 => "000101011011110000011100101011111111000111101111010110001010000111110101000111111010011010111101111011011000011000011101000000100010000111111001000111111100001111011111001100101011111000010000110110111110011011110111011111011110111100100011", 
    24 => "000000011111001000011100101011000001101101110111100011111010000010000011110000000110100110000100010111110001000000101111111100000111001000000110110111000000001100001111111000100100000001000110101000001101111100000010011000000111111111100111", 
    25 => "000000011111001000110101100110111111000111101111010110001010000000001000101111111010011010000001001001101001011011100110111101100101011111111001000111000000001100001000000111001101000010110111110111111110000010000010011000000111111111100111", 
    26 => "001010011000100000011100101011111100100001100111111111011000000010000011110111100010000011000100010111110000011000011101111100000111001111101011010110000110000111010000010101110101000100101001000000001101111100000100110010110111111111100111", 
    27 => "000111111010001000110101100110000100010011111111111111011000000010000011110111111010011010111111100010100111100010101111000010000000011000000110110111111110001101110000000111001101111101100100010111111110000010111110101111110111101110110110", 
    28 => "000000011111001111010001111011111111000111101111010110001010000000001000101000110111010100111101111011011000001011000001111001001010100001011001010111000000001100001111011011010011000001000110101111101110001000111101100010011111011110000101" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "block";

attribute EQUIVALENT_REGISTER_REMOVAL : string;
begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity svm_classifier_SVs_h_V_8 is
    generic (
        DataWidth : INTEGER := 240;
        AddressRange : INTEGER := 29;
        AddressWidth : INTEGER := 5);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of svm_classifier_SVs_h_V_8 is
    component svm_classifier_SVs_h_V_8_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    svm_classifier_SVs_h_V_8_rom_U :  component svm_classifier_SVs_h_V_8_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


