# ddnet_base

The core helpers from the ddnet project as standalone library.
The code in src/ is an unmodified copy from https://github.com/ddnet/ddnet/.
Full credits go to the ddnet contributors.

```cpp
// sample.cpp

#include <cstdio>
#include <ddnet_base/base/str.h>

int main() {
        char aBuf[512];
        str_copy(aBuf, "foo");
        printf("%s\n", aBuf);
}
```

```
mkdir build
cd build
cmake ..
make install
g++ sample.cpp -lddnet_base
./a.out # => foo
```
