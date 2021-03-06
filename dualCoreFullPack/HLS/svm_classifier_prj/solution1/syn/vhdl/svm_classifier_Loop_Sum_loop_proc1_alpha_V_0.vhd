-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity svm_classifier_Loop_Sum_loop_proc1_alpha_V_0_rom is 
    generic(
             dwidth     : integer := 13; 
             awidth     : integer := 7; 
             mem_size    : integer := 117
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of svm_classifier_Loop_Sum_loop_proc1_alpha_V_0_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 to 10=> "0000010000101", 11 => "1100000110110", 12 => "0000010000101", 
    13 => "1110111101011", 14 to 16=> "0000010000101", 17 => "1111001110010", 
    18 to 28=> "0000010000101", 29 => "1110101100110", 30 => "0000010000101", 
    31 to 32=> "1111101111010", 33 to 46=> "0000010000101", 47 => "1101001000111", 
    48 to 53=> "0000010000101", 54 => "1001011111110", 55 => "1111011110101", 
    56 to 77=> "0000010000101", 78 => "1111101111010", 79 to 81=> "0000010000101", 
    82 => "1111011110101", 83 to 90=> "0000010000101", 91 => "1111001110010", 
    92 => "0000010000101", 93 => "1111101111010", 94 => "0000010000101", 
    95 to 96=> "1111101111010", 97 to 103=> "0000010000101", 104 => "1111101111010", 
    105 to 108=> "0000010000101", 109 => "1111101111010", 110 to 115=> "0000010000101", 
    116 => "1111011110101" );


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

entity svm_classifier_Loop_Sum_loop_proc1_alpha_V_0 is
    generic (
        DataWidth : INTEGER := 13;
        AddressRange : INTEGER := 117;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of svm_classifier_Loop_Sum_loop_proc1_alpha_V_0 is
    component svm_classifier_Loop_Sum_loop_proc1_alpha_V_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    svm_classifier_Loop_Sum_loop_proc1_alpha_V_0_rom_U :  component svm_classifier_Loop_Sum_loop_proc1_alpha_V_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


