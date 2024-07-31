# Constraint File for HexadecimalCounter

NET "MCLK" LOC = "B8";       # Clock input
NET "clock" LOC = "M5";      # 1Hz clock output

# LEDs to display the counter
NET "countLED(0)" LOC = "M11";
NET "countLED(1)" LOC = "P7";
NET "countLED(2)" LOC = "P6";
NET "countLED(3)" LOC = "N5";

NET "reset" LOC = "A7";      # Reset button input

# Anode control for the 7-segment display
NET "AN(0)" LOC = "K14";
NET "AN(1)" LOC = "M13";
NET "AN(2)" LOC = "J12";
NET "AN(3)" LOC = "F12";

# Output to the 7-segment display
NET "hex(6)" LOC = "L14";
NET "hex(5)" LOC = "H12";
NET "hex(4)" LOC = "N14";
NET "hex(3)" LOC = "N11";
NET "hex(2)" LOC = "P12";
NET "hex(1)" LOC = "L13";
NET "hex(0)" LOC = "M12";
