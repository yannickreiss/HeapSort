# Makefile
NAME		=	HeapSort
CC		=	gcc
CFLAGS	=	-Wall -g -I include
LDFLAGS	=	-Wall -g
INCLUDE	=	unittests.h heap.h stringops.h
OBJECTS	=	unittests.o heap.o stringops.o main.o

# compile program listed in $(NAME)
$(NAME): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $(NAME) $(OBJECTS)

# compile sources into objects
%.o: %.c $(INCLUDE)
		$(CC) $(CFLAGS) -c -o $@ $<

# report missing requirements
%.c:
	echo ERROR: MISSING $@

# Build and execute program
run: $(NAME)
	./$(NAME); make clean

# check for errors
check: $(NAME)
	make; make clean

# creates diagram with python3, matplotlib
visualize:
	python3 visualize.py

# compress into tarball
archive: $(NAME)
	make clean
	tar -zcvf ../$(NAME).tar.gz ./

# clean up objects and executable
clean:
	rm $(NAME) *.o

.PHONY: run
.PHONY: check
.PHONY: visualize
.PHONY: archive
.PHONY: clean
