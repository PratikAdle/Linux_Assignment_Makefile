OUT = bin/output

CC = gcc

ODIR = objs
SDIR = src
INC = inc
BIN = bin
LIB = lib
_LIB = lib_file_2.a


CFLAGS = -I$(INC)

_OBJS = main.o file_1.o  
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

$(OUT) : $(OBJS) $(LIB)/$(_LIB)
	$(CC) -o $@ $^

$(ODIR)/%.o: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(OUT)
