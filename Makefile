OUT = bin/output
CC = gcc
ODIR = objs
SDIR = src
INC = inc
CFLAGS = -I$(INC)

_OBJS = main.o file_1.o file_2.o 
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))


$(ODIR)/%.o: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@

$(OUT): $(OBJS) 
	$(CC) -o $@ $^

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(OUT)
