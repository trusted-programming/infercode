wget https://github.com/bazelbuild/bazel/releases/download/3.7.2/bazel-3.7.2-linux-x86_64
chmod +x bazel-3.7.2-linux-x86_64
sudo mv bazel-3.7.2-linux-x86_64 /usr/local/bin/bazel
sudo apt install clang-14
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-14 150
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-14 150
sudo ln -s /usr/bin/python3 /usr/bin/python
export CC=clang CXX=clang++
# /root/.cache/bazel/_bazel_root/2c92b5569ddded7b3a6bd5e139451b60/execroot/org_tensorflow/external/ruy/ruy/block_map.cc
# #include <limits>
bazel build --copt=-mno-avx --copt=-mno-avx2 --copt=-mno-fma \
  --copt=-Wno-error=gnu-offsetof-extensions --copt=-O2 \
  --verbose_failures //tensorflow/tools/pip_package:build_pip_package
