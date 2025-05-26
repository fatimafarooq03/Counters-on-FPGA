# FPGA Counter Designs
## Overview
This repository contains two FPGA designs implemented using VHDL: a Decimal Counter and a Hexadecimal Counter. Both counters are designed to drive a 7-segment display and provide visual output using LEDs. These designs are suitable for learning about digital logic design, clock division, and basic FPGA programming.

## Projects
### 1. Decimal Counter (Video Demonstration)[https://drive.google.com/file/d/1cE2tddH_XlOiGX3hJGWZlMrQf-qMT2oN/view?usp=sharing] 
#### Description:
The Decimal Counter counts from 0 to 15 (in decimal) and displays the count on a 7-segment display. The counter also controls LEDs to visually represent the current count.

#### Files:

- DecimalCounter.vhd: Contains the VHDL code for the Decimal Counter, including entity declaration, architecture, and processes for clock division and 7-segment display driving.
- DecimalCounter.xdc: The constraints file that maps the Decimal Counter’s signals to the FPGA’s physical pins.
#### Features:

- Displays decimal count (0-15) on a 7-segment display.
- Controls LEDs to represent the count in binary.
- Includes a reset function to restart the count.
### 2. Hexadecimal Counter
#### Description:
The Hexadecimal Counter counts from 0 to 15 (in hexadecimal) and displays the count on a 7-segment display. The count is also output on LEDs in binary form.

#### Files:

- HexadecimalCounter.vhd: Contains the VHDL code for the Hexadecimal Counter, including entity declaration, architecture, and processes for clock division and 7-segment display driving.
- HexadecimalCounter.xdc: The constraints file that maps the Hexadecimal Counter’s signals to the FPGA’s physical pins.
#### Features:

- Displays hexadecimal count (0-F) on a 7-segment display.
- Outputs the count to LEDs as a binary representation.
- Includes a reset function to restart the count.
