mkdir -p build/
rm -rf build/*
cd build/
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER="/usr/bin/gcc" -DCMAKE_CXX_COMPILER="/usr/bin/g++" ../mongoose
make

cd ../

mkdir -p bin/
mkdir -p bin/win
mkdir -p bin/linux
cp build/libmongoose.so bin/linux/libmongoose.so