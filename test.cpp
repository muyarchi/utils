#include <iostream>
#define NUM_OF_CLASSES 3

class A {
  public:
     A() { std::cout << "A created" << std::endl; }
     ~A() { std::cout << "A deleted" << std::endl; }
};

A* allocate(int numOfClasses)
{
    return new A[numOfClasses];
}

int main()
{
    A *anArray = allocate(NUM_OF_CLASSES);
    // do tests
    delete[] anArray;

    return 0;
}
