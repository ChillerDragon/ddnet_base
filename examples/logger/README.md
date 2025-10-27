# logger example

Needs ddnet_base installed system wide. So first go to the root of the repo and install the ddnet_base.

```
cd ../../
mkdir build && cd build
cmake ..
sudo make install
```

```
mkdir build
cd build
cmake ..
make
./logger_example # => 2025-10-28 13:21:20 I sample: hello world
```
