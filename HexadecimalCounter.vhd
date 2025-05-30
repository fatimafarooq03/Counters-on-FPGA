-- HexadecimalCounter.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HexadecimalCounter is
    Port ( 
        MCLK : in  STD_LOGIC; -- input to take in the standard clock on the FPGA board
        reset : in  STD_LOGIC; -- reset button
        clock : out STD_LOGIC; -- output of the 1Hz clock
        AN : out STD_LOGIC_VECTOR(3 downto 0); -- anode that controls the 7 segment display
        hex : out STD_LOGIC_VECTOR(6 downto 0); -- the output to the seven segment display
        countLED : out STD_LOGIC_VECTOR(3 downto 0) -- LEDs to display the counter 
    );
end HexadecimalCounter;

architecture Behavioral of HexadecimalCounter is

    signal count : integer := 1; -- counts the number of cycles to divide the frequency
    signal seconds: integer := 0; -- keeps track of the seconds
    signal clk : std_logic := '0'; -- clock signal of frequency 1Hz

begin

    -- Clock division process
    process(MCLK)
    begin
        if (MCLK'event and MCLK = '1') then -- if there is a clock event and the signal is high
            count <= count + 1; -- this counts the number of cycles of the clock

            if (count = 25000000) then
                clk <= not clk; -- shifts the clock signal after this many cycles to create a signal of 1Hz
                clock <= clk; -- output the clock signal to the output
                count <= 1; -- resets the counter so the process continues in a loop
            end if;
        end if;
    end process;

    -- Seconds counter process
    process(clk)
    begin 
        if (rising_edge(clk)) then
            seconds <= seconds + 1; -- counts the number of seconds (counts every cycle in 1Hz frequency)
        end if;

        if (seconds = 16) then
            seconds <= 0; -- resets the seconds to 0 when they equal to 16
        end if;

        if (reset = '1') then 
            seconds <= 0; -- if the reset button is pressed, seconds is again reset to 0
        end if;

        countLED <= std_logic_vector(to_unsigned(seconds, countLED'length)); -- converts the seconds integer to a binary vector to display on LED
    end process;

    -- Process for displaying the hexadecimal value on the 7-segment display
    process(seconds)
    begin 
        AN <= "0111"; -- activates AN(0)
        case seconds is 
            when 0 => hex <= "0000001"; -- shows 0
            when 1 => hex <= "1001111"; -- shows 1
            when 2 => hex <= "0010010"; -- shows 2
            when 3 => hex <= "0000110"; -- shows 3
            when 4 => hex <= "1001100"; -- shows 4
            when 5 => hex <= "0100100"; -- shows 5
            when 6 => hex <= "0100000"; -- shows 6
            when 7 => hex <= "0001111"; -- shows 7
            when 8 => hex <= "0000000"; -- shows 8 
            when 9 => hex <= "0000100"; -- shows 9
            when 10 => hex <= "0001000"; -- shows A
            when 11 => hex <= "1100000"; -- shows b in lowercase so as to be distinct from 8
            when 12 => hex <= "0110001"; -- shows C
            when 13 => hex <= "1000010"; -- shows d in lowercase so as to be distinct from 0
            when 14 => hex <= "0110000"; -- shows E 
            when 15 => hex <= "0111000"; -- shows F
            when others => null;
        end case;    
    end process;    

end Behavioral;
