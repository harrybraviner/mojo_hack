all: register_test

register_test: src/register.v src/tests/register_test.v tests
	iverilog $^ -o tests/register_test

tests:
	mkdir tests

clean:
	rm -rf tests
