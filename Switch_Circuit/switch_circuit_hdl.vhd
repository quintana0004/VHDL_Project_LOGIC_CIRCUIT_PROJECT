library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Switch_Circuit is
    port (
        channel_in : in std_logic_vector(0 downto 6); -- input channel of 7 bits
        flip : in std_logic; -- input flip detects flip with 1 or 0 not being there
        clk : in std_logic; -- input clk variable
        reset : in std_logic; -- input reset variable 
        channel_out: out std_logic_vector(0 downto 6) -- output channel of 7 bits
    );
end Switch_Circuit;

architecture Behavior of Switch_Circuit is

    --creating constants for 0-64, 65-90,91-96,97-122,123-126
    constant zero : std_logic_vector(0 downto 6):="0000000";
    constant sixtyfour : std_logic_vector(0 downto 6):="1000000";
    constant sixtyfive : std_logic_vector(0 downto 6):="1000001";
    constant ninety : std_logic_vector(0 downto 6):= "1011010";
    constant ninetyone : std_logic_vector(0 downto 6):= "1011011";
    constant ninetysix : std_logic_vector(0 downto 6):= "1100000";
    constant ninetyseven : std_logic_vector(0 downto 6):="1100001";
    constant onehundredtwentytwo : std_logic_vector(0 downto 6):="1111010";
    constant onehundredtwentythree : std_logic_vector(0 downto 6):="1111011";
    constant onehundredtwentysix : std_logic_vector(0 downto 6):="1111110";

 --Function return true or false if is in 0 to 64
    function Compare_First_0_64_1(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is 
      begin
        if(channel = zero or channel > zero) then
            return(true);
        else
            return(false);
        end if;
    end Compare_First_0_64_1;

    function Compare_First_0_64_2(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is
        begin
            if(channel = sixtyfour or channel < sixtyfour) then
                return(true);
            else
                return(false);
        end if;
    end Compare_First_0_64_2;

    --Function return true or false if is in 65 to 90
    function Compare_65_90_1(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is 
      begin
        if(channel = sixtyfive or channel > sixtyfive) then
            return(true);
        else
            return(false);
        end if;
    end Compare_65_90_1;

    function Compare_65_90_2(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is
        begin
            if(channel = ninety or channel < ninety) then
                return(true);
            else
                return(false);
        end if;
    end Compare_65_90_2;

    --Function return true or false if is in 91 to 96
    function Compare_91_96_1(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is 
      begin
        if(channel = ninetyone or channel > ninetyone) then
            return(true);
        else
            return(false);
        end if;
    end Compare_91_96_1;

    function Compare_91_96_2(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is
        begin
            if(channel = ninetysix or channel < ninetysix) then
                return(true);
            else
                return(false);
        end if;
    end Compare_91_96_2;

    --Function return true or false if is in 97 to 122
    function Compare_97_122_1(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is 
      begin
        if(channel = ninetyseven or channel > ninetyseven) then
            return(true);
        else
            return(false);
        end if;
    end Compare_97_122_1;

    function Compare_97_122_2(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is
        begin
            if(channel = onehundredtwentytwo or channel < onehundredtwentytwo) then
                return(true);
            else
                return(false);
        end if;
    end Compare_97_122_2;

    --Function return true or false if is in 123 to 126
    function Compare_123_126_1(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is 
      begin
        if(channel = onehundredtwentythree or channel > onehundredtwentythree) then
            return(true);
        else
            return(false);
        end if;
    end Compare_123_126_1;

    function Compare_123_126_2(
        channel : in std_logic_vector(0 downto 6)
    ) return boolean is
        begin
            if(channel = onehundredtwentysix or channel < onehundredtwentysix) then
                return(true);
            else
                return(false);
        end if;
    end Compare_123_126_2;

    --Function that calculates the 7 bits 
    function ADDORSUBTRACT(
        channel: in std_logic_vector(0 downto 6)
    ) return std_logic_vector is
     variable TEMP : std_logiv_vector(0 downto 6);
      begin
        if(Compare_First_0_64_1(channel) and Compare_First_0_64_2(channel)) then
            --continue with picture at discord 


begin
    CLOCK:process(CLK)
        begin
        if(CLK'event and CLK ='1')then
            if(reset='1')then
                channel_out<="0000000";
            end if;
        end if;
    end process;
    
    OUTPUT_CHANNEL:process(channel_in)
        begin



        

end architecture;