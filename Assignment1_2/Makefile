OUT = bin/output
CC = gcc
ODIR = objs
SDIR = src
INC = inc
LIB = lib

_LIB = -l_file_2
CFLAGS = -I$(INC)

_OBJS = main.o file_1.o file_2.o 
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))


$(ODIR)/%.o: $(SDIR)/%.c 
	$(CC) $(CFLAGS) $(_LIB) -c $< -o $@

$(OUT): $(OBJS) 
	$(CC) -o $@ $^

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(OUT)
