all: register_test program_counter_test

register_test: src/register.v src/tests/register_test.v tests
	iverilog $^ -o tests/register_test

program_counter_test: src/program_counter.v src/tests/program_counter_test.v tests
	iverilog $^ -o tests/program_counter_test

tests:
	mkdir tests

clean:
	rm -rf tests
