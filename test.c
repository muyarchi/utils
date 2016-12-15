#include <stdlib.h>

void f(void *x)
{
}

void g(void)
{
    f((void*)0xdeafbabe);
    realloc((void*)0xdeafbabe, 20);
}

int main()
{
    g();
}
