TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

run: clean default
	./$(TARGET) -f ./employees.db -n
	./$(TARGET) -f ./employees.db -a "John Doe,123 Main St,40"
	./$(TARGET) -f ./employees.db -a "Jane Smith,456 Oak Ave,35"
	./$(TARGET) -f ./employees.db -a "Jim Beam,789 Pine Rd,25"
	./$(TARGET) -f ./employees.db -a "Jill Johnson,101 Maple Ln,30"
	./$(TARGET) -f ./employees.db -a "Jack White,202 Birch St,20"
	./$(TARGET) -f ./employees.db -a "Jill Johnson,101 Maple Ln,30"

default: $(TARGET)

clean:
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

$(TARGET): $(OBJ)
	gcc -o $@ $?

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude