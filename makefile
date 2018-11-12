TARGET = myos.iso
BINARY = myos.bin
CC = i686-elf-gcc
AS = i686-elf-as
LINK = linker.ld
CFLAGS = -ffreestanding -O2
OBJS = boot.o kernel.o

$(TARGET): $(BINARY)
	cp $< "isodir/boot/$<"
	grub-mkrescue -o $@ isodir
	qemu-system-i386 -cdrom myos.iso
	
$(BINARY): $(OBJS)
	$(CC) -T $(LINK) -o $@ $(CFLAGS) -nostdlib $(OBJS) -lgcc

boot.o: boot.s
	$(AS) $< -o $@

kernel.o: kernel.c
	$(CC) -c $< -o $@ -std=gnu99 $(CFLAGS) -Wall -Wextra

clean:
	@rm -f $(TARGET) $(OBJS) $(BINARY)
	@echo "objects deleted"


