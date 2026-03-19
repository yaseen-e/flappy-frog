onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.rom1kx8 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {rom1kx8.udo}

run 1000ns

quit -force
