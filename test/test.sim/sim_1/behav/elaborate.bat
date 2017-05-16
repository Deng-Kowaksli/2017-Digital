@echo off
set xv_path=M:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 807b5f9b1e5c44f395da3f0fcfb54ecb -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_tb_behav xil_defaultlib.test_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
