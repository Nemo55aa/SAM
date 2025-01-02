OBJS = reciter.o sam.o render.o main.o debug.o processframes.o createtransitions.o

CC = gcc

# libsdl present
CFLAGS =  -Wall -O2 -DUSESDL `pkg-config --cflags sdl2`
LFLAGS = `pkg-config --libs sdl2`

# no libsdl present
#CFLAGS =  -Wall -O2
#LFLAGS = 

sam: $(OBJS)
	$(CC) -o sam $(OBJS) $(LFLAGS)

%.o: src/%.c
	$(CC) $(CFLAGS) -c $<

package: 
	tar -cvzf sam.tar.gz README.md Makefile sing src/

clean:
	rm *.o
