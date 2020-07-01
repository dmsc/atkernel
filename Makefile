

MADS=mads
OUT=build


SRC_SHARED=\
 src/atarifont.inc \
 src/boot.s \
 src/cassette.s \
 src/cio.inc \
 src/cio.s \
 src/disk.s \
 src/editor.s \
 src/hardware.inc \
 src/init.s \
 src/interrupt.s \
 src/irq.s \
 src/kerneldb.inc \
 src/keyboard.s \
 src/keytable.s \
 src/mathpack.s \
 src/misc.s \
 src/printer.s \
 src/screenext.s \
 src/screen.s \
 src/sio.inc \
 src/sio.s \
 src/vbi.s \
 src/version.inc \

SRC_800=\
 src/blackboard.s \

SRC_XL=\
 src/atariifont.inc \
 src/bootscreen.s \
 src/driveimage.inc \
 src/pbi.s \
 src/phandler.s \
 src/selftestentry.s \

all:\
    $(OUT)/kernel.rom \
    $(OUT)/kernelxl.rom \

$(OUT)/kernelxl.rom: main.xasm $(SRC_XL) $(SRC_SHARED) | $(OUT)
	$(MADS) -d:_KERNEL_XLXE=1 -s -p -i:src -i:fnt -b:49152 -l:$(@:.rom=.lst) -t:$(@:.rom=.lab) -o:$@ $<


$(OUT)/kernel.rom: main.xasm $(SRC_800) $(SRC_SHARED) | $(OUT)
	$(MADS) -d:_KERNEL_XLXE=0 -s -p -i:src -i:fnt -b:55296 -l:$(@:.rom=.lst) -t:$(@:.rom=.lab) -o:$@ $<


$(OUT):
	mkdir -p $(OUT)

