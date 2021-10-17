--Name: Jessica Quintana
--Project Name: Project Logic Circuit
--Version: Verion 1 is based of
--Discuss: Switch Circuit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Switch_Circuit is
    port (
        unsigned channel_IN : in std_logic_vector(6 downto 0);
        flip : in std_logic; -- input flip detects flip with 1 or 0 not being there
        clk: in std_logic; -- input clk variable
        reset: in std_logic; -- input reset variable 
        unsigned channel_OUT: out std_logic_vector(6 downto 0) -- output channel of 7 bits
    );
end Switch_Circuit;

architecture Behavior of Switch_Circuit is

function Comparador( channel: std_logic_vector(6 downto 0)) 
    return boolean is variable choice: boolean;
    begin
        -- Compare if it is a uppercase letter 65 - 90
        if (channel = "1000001" or channel > "1000001" and channel = "1011010" or channel < "1011010")then
            choice <= TRUE;
            return choice;
            --Compare if it is a lowercase letter 97 - 122
        elsif(channel = "1100001" or channel > "1100001" and channel = "1111010" or channel < "1111010")then
            choice <= FALSE;
            return choice;
        end if;
    end Comparador;

   
    function Adder_Subtractor( channel: std_logic_vector(6 downto 0), choice: boolean)
        return std_logic_vector(6 downto 0) is
        begin
            signal sum: std_logic_vector(6 downto 0);
            signal carry_in: std_logic;
            signal carry_out: std_logic;
            if (choice)then
                channel_OUT = channel + "0100000";
            else
                channel_OUT = channel - "0100000";
            end if;
        end Adder_Subtractor;

begin

    -- Creating the clock process 
    SYNC_PROC: process (ck,reset)
    begin
        if (ck'event and ck = '1') then
            if (reset = '1') then
            flip <= '0';                     
            end if;
        end if;
    end process;

  -- create a process to compare if the process to identify the flip 
  FLIPPED_PROC:process(flip)
    begin
        if(flip = '0')then
            channel_OUT <= channel_IN;
            else 
                variable choice: boolean;
                choice<=Comparator(channel_IN);
                channel_OUT<= Adder_Subtractor(channel_IN,choice);
            end if;

    end process;


end architecture;