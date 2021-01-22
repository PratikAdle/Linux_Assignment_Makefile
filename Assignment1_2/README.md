### Objective: 
- Define any functions in file_1.c and file_2.c and call it from main.c.
- Place the corresponding header files in inc directory.
- Compile the program from command line using a Makefile. Using "make" the object file(*.o) should placed in objs directory and the executable should be in bin directory. Using "make clean", all the object files and executable should be deleted.
- Create a static library file for file_2.c and use it in Makefile.

### Procedure:
- Make directories named bin, inc, lib, objs and src using "mkdir" command
- Create two c files file_1.c and file_2.c in "src" each of which defines a function to print a statement
- Add header files to these functions in "inc" directory
- Call these two functions in the main.c file in "src" folder
- Create a static library file for file_2.c. To create library file for file_2.c first create object file for file_2. Then create library file for it i.e. lib_file_2.a. Then, place the library file in "lib" folder and delete file_2.o and file_2.c files.
```
$ gcc -c file_2.c   // produces a file_2.o object file

$ ar -rc lib_file_2.a file_2.o // produces static library file
```
- Create a Makefile to compile the main file in such a way that:
  1) Object files are placed in "objs" directory and executable in "bin" directory when we use "make" command and
  2) All the object files and executable are deleted when we use "make clean" command 

### Makefile:
```
# Target folder for executable
OUT = bin/output 

# Variable for gcc
CC = gcc

# Directories objs, src, inc, bin and lib 
ODIR = objs
SDIR = src
INC = inc
BIN = bin
LIB = lib

# lib_file_2.a which is present in lib drectory
_LIB = lib_file_2.a

# CFLAGS - It Specifies a directory to search for included files i.e. using "-I" flag 
# In this case it searches for header files in "inc" directory
CFLAGS = -I$(INC)

# Variable for all the object files
_OBJS = main.o file_1.o  
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

# Using "make" command will generate following files:

# To create output executable file which depends on object files (denoted by OBJS variable i.e. $(OBJS)) and library file ( denoted by ($LIB)/$(_LIB)). i.e. $(OBJECT) following command is used-
$(OUT) : $(OBJS) $(LIB)/$(_LIB)
	$(CC) -o $@ $^

# To create objecte file which depends on source files from src directory ($(SDIR)) following command is used-
$(ODIR)/%.o: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean

# Using "make clean" command will delete all the object file ($(ODIR)) and output executable file ($(OUT))
clean:
	rm -f $(ODIR)/*.o $(OUT)


# Use of .PHONY - In this "make clean" target will not work properly if a file named clean is ever created in this directory. To avoid this problem we explicitly declare the target to be phony by making it a prerequisite of the special target .PHONY. 

```

### Result:
- Using command "make", the directory structure is as follows:
```
├── bin
│   └── output
├── inc
│   ├── file_1.h
│   └── file_2.h
├── lib
│   └── lib_file_2.a
├── Makefile
├── objs
│   ├── file_1.o
│   └── main.o
└── src
    ├── file_1.c
    └── main.c

5 directories, 9 files
```
This command creates object files in "objs" directory and executable file in "bin" directory.


- Using command "make clean", the directory structure is as follows:
```
├── bin
├── inc
│   ├── file_1.h
│   └── file_2.h
├── lib
│   └── lib_file_2.a
├── Makefile
├── objs
└── src
    ├── file_1.c
    └── main.c

5 directories, 6 files
```
This command deletes the object files from "objs" directory and executable file from "bin" directory.
