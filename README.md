### Summary

It seems there is a bug in handling of AND-reduction (and possibly other reductions, I haven't checked)
for wires with >64-bits.
I have confirmed the buggy behavior in versions >= 4.026.

This test case compares the results of equivalent operations AND-reduce and checking equality with all ones for a 68-bit register:
```verilog
  assign and_reduce = &r;
  assign check_equal = r == 68'hffff_ffff_ffff_ffff_f;
```

To reproduce, setup verilator and run:
```
make run
```

On versions < 4.026 you will see the correct output:
```
reset = 0, r = 00000000000000000, and_reduce = 0, check_equal = 0
reset = 0, r = ffffffffffffffffe, and_reduce = 0, check_equal = 0
reset = 0, r = fffffffffffffffff, and_reduce = 1, check_equal = 1
```

For versions >= 4.026, you will see the incorrect output:
```
reset = 0, r = 00000000000000000, and_reduce = 1, check_equal = 0
reset = 0, r = ffffffffffffffffe, and_reduce = 0, check_equal = 0
reset = 0, r = fffffffffffffffff, and_reduce = 0, check_equal = 1
```
