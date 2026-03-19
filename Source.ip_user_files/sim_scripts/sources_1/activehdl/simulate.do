transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+rom1kx8  -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.rom1kx8 xil_defaultlib.glbl

do {rom1kx8.udo}

run 1000ns

endsim

quit -force
