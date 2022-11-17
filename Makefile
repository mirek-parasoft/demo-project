CC=gcc
INCLUDE_FLAGS=-I.
LINK_FLAGS=
DEBUG_FLAGS=
CFLAGS=-g -std=c11

SRCS = driver.c \
       sensor.c 

#SRCS = clock.c \
       driver.c \
       timer.c \
	   mathLib.c \
	   stdinout.c	


OBJ = $(SRCS:.c=.o)

EXEC=timer.exe

.PHONY = clean all

all : $(OBJ)

$(EXEC) : $(OBJ)
	$(CC) $^ $(LINK_FLAGS) -o $@

%.o : %.c
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) -o $@ -c $<

clean:
	rm -rf $(OBJ) $(EXEC)
