#include "Vtest.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char** argv)
{
    Verilated::commandArgs(argc, argv);

    // init top verilog instance
    Vtest* top = new Vtest();

    top->clock   = 0;
    top->reset   = 0;
    top->eval();

    top->reset   = 1;
    top->eval();

    top->clock   = 1;
    top->eval();

    top->clock   = 0;
    top->reset   = 0;
    top->eval();

    top->clock   = 1;
    top->eval();
    top->clock   = 0;
    top->eval();
    top->clock   = 1;
    top->eval();
    top->clock   = 0;
    top->eval();
    top->clock   = 1;
    top->eval();
}
