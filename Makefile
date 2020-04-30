
all: obj_dir/Vtest

obj_dir/Vtest.mk: test.v top.cpp
	verilator -cc $< --exe top.cpp

obj_dir/Vtest: obj_dir/Vtest.mk
	make -C obj_dir/ -f Vtest.mk Vtest

run: obj_dir/Vtest
	$<


clean:
	rm -rf obj_dir

.PHONY: clean run
