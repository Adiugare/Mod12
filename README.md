# Mod12
A Mod-12 counter is a sequential digital circuit that counts from 0 to 11 (12 states in total) and then resets back to 0
The given Verilog code implements a 4-bit synchronous Mod-12 up counter with reset and load functionalities.

🔹 Inputs and Outputs

clk (Clock): The counter updates its value at the rising edge of the clock.
rst (Reset): When high, the counter is reset to 0000.
load (Load): When high, the counter loads a fixed value 1011 (decimal 11).
d [3:0]: Preset input (though not used here, the load forces 11 instead of d).
q [3:0]: The 4-bit counter output.

🔹 Operation

Reset Condition:
If rst = 1, the counter is cleared → q = 0000.
Load Condition:
If load = 1, the counter loads 11 (decimal) directly into q.
(Note: In this code, d is not actually used. It always loads 11 instead of d.)

Counting Condition:

If neither rst nor load is active:
The counter increments by 1 each clock pulse.
If q = 11 (1011), the next count wraps back to 0.
So, it counts as: 0 → 1 → 2 → … → 11 → 0 → …

🔹 Behavior Summary (Priority order)

Reset has the highest priority.
Load has second priority (forces q=11).
Normal counting occurs otherwise.

🔹 Applications

Useful in frequency dividers (÷12).
Can be used in digital clocks or systems needing modulo-12 counting.
Load feature allows quick preset to 11 for timing adjustments.
