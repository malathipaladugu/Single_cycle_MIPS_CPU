# Single-Cycle-MIPS-CPU
*** Results can be found in MIPS_Report.pdf.<br>
In this project, a 16-bit single-cycle MIPS processor is implemented in Verilog HDL. MIPS is an RISC processor.<br>
R-type, I-type and J-type instructions are implemented in this project.<br>
![Screenshot 2024-08-14 002521](https://github.com/user-attachments/assets/4b6d8f59-1b44-4236-8d1d-697628810627)<br>
<font size="4">14.mul (Multiply): R[rd](15 downto 0) = R[rs](7 downto 0) * R[rt](7 downto 0) <br>
15.sll (shift left logical):R[rd](15 downto 0) = R[rs](15 downto 0)<<R[rt](2 downto 0)<br>
16.srl (shift right logical): R[rd](15 downto 0) = R[rs](15 downto 0)>>R[rt](2 downto 0)<br>
Above is the description of instructions being implemented in this project.</font><br>
Logarithmic Barrel shifter was used for sll and slr instruction.
