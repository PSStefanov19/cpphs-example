#include <stdio.h>
#include <iostream>
#include "a_stub.h"

int main(int argc, char *argv[])
{
    hs_init(&argc, &argv);

    std::cout << foo(5);

    hs_exit();
}