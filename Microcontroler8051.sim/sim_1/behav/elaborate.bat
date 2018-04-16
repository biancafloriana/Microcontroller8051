@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 64041288a8674c45a7590be736c84afe -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip -L xpm --snapshot ALU8bit_tb_behav xil_defaultlib.ALU8bit_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
