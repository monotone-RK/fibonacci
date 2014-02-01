GCC     = gcc -std=c99 -Wall -W -g -o
SRCC    = main.c
TARGETC = fibc

IV      = iverilog -o
GTK     = gtkwave
VCD     = uut.vcd
SRCV    = main.v
TARGETV = fibv

PY      = python
SRCPY   = main.py

all:
	$(GCC) $(TARGETC) $(SRCC)
	$(IV) $(TARGETV) $(SRCV)

run:
	./$(TARGETC)
	vvp $(TARGETV)
	$(PY) $(SRCPY)

view:
	$(GTK) $(VCD) &

clean:
	rm -f $(TARGETC) $(TARGETV) $(VCD)
