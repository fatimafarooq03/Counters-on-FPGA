# Constraint File for DecimalCounter

NET "MCLK" LOC = "B8";      # Clock input
NET "reset" LOC = "A7";     # Reset button input

# Common anode for controlling 7 segment display
NET "AN(0)" LOC = "K14";
NET "AN(1)" LOC = "M13";
NET "AN(2)" LOC = "J12";
NET "AN(3)" LOC = "F12";

# Output for 7 segment display
NET "dec(6)" LOC = "L14";
NET "dec(5)" LOC = "H12";
NET "dec(4)" LOC = "N14";
NET "dec(3)" LOC = "N11";
NET "dec(2)" LOC = "P12";
NET "dec(1)" LOC = "L13";
NET "dec(0)" LOC = "M12";
