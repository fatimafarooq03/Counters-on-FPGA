-- DecimalCounter.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DecimalCounter is
    Port ( 
        MCLK : in  STD_LOGIC; -- standard clock input
        reset : in  STD_LOGIC; -- reset button input
        AN : out  STD_LOGIC_VECTOR(3 downto 0); -- common anode for controlling 7 segment display
        dec : out  STD_LOGIC_VECTOR(6 downto 0) -- output for 7 segment display
    );
end DecimalCounter;

architecture Behavioral of DecimalCounter is

    signal count : integer := 1; -- counts the number of cycles to divide the frequency for the 1Hz clock
    signal countAN : integer := 1; -- counts the number of cycles to divide the frequency for the frequency changing for the anode switch
    signal sel : std_logic_vector(3 downto 0); -- signal to know which 7 segment to turn on
    signal seconds: integer := 0; -- keeps track of the seconds
    signal digit: integer := 0; -- stores the digit to display for a specific 7 segment
    signal clk : std_logic := '0'; -- clock signal of frequency 1Hz

begin

    -- Clock division process
    process(MCLK)
    begin
        if(MCLK'event and MCLK='1') then
            countAN <= countAN + 1; -- increments countAN to generate a signal for 7 segment alternation
            count <= count + 1;

            if (countAN = 25000) then -- half cycle: show the first segment display
                sel <= "1011"; 
            end if;

            if (countAN = 50000) then -- full cycle: show the second segment display
                sel <= "0111"; 
                countAN <= 1; -- resets countAN
            end if;

            if(count = 25000000) then -- 1Hz clock generation
                clk <= not clk;
                count <= 1;
            end if;
        end if;
    end process;

    -- Main counter process
    process (clk)
    begin 
        if (rising_edge(clk)) then
            seconds <= seconds + 1; 
        end if; 

        if (seconds = 16) then
            seconds <= 0; 
        end if;

        if(reset = '1') then 
            seconds <= 0;
        end if;
    end process;

    -- Multiplexing the sel signal to turn on specific 7 segment
    with (sel) select
        AN <= "0111" when "0111",
              "1011" when "1011",
              "1111" when others; 

    -- Process for assigning digits to the 7-segment display
    process(seconds, sel)
    begin
        if (sel = "1011" and seconds <= 9) then
            digit <= 0;
        elsif (sel = "1011" and seconds > 9) then
            digit <= 1;
        elsif (sel = "0111" and seconds > 9) then
            digit <= seconds - 10;
        elsif (sel = "0111" and seconds <= 9) then
            digit <= seconds; 
        end if;

        -- 7-segment display output according to the digit value
        case digit is 
            when 0 => dec <= "0000001"; -- shows 0
            when 1 => dec <= "1001111"; -- shows 1
            when 2 => dec <= "0010010"; -- shows 2
            when 3 => dec <= "0000110"; -- shows 3
            when 4 => dec <= "1001100"; -- shows 4
            when 5 => dec <= "0100100"; -- shows 5
            when 6 => dec <= "0100000"; -- shows 6
            when 7 => dec <= "0001111"; -- shows 7
            when 8 => dec <= "0000000"; -- shows 8 
            when 9 => dec <= "0000100"; -- shows 9
            when others => null;
        end case;
    end process; 

end Behavioral;
