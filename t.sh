export PS1="$ "
echo DEMO
rm -rf abc
echo infercode can run on multiple programming languages:
echo 1. Python example:
echo infercode setup.py
infercode setup.py
echo cat setup.py.embedding
cat setup.py.embedding
sleep 2
echo 2. Rust example:
echo cargo init --bin abc
cargo init --bin abc
echo cd abc
cd abc
echo cat src/main.rs
cat src/main.rs
echo infercode src/main.rs
infercode src/main.rs
echo cat src/main.rs.embedding
cat src/main.rs.embedding
echo cd -
cd -
echo 3. A C example from Rosetta Code:
echo infercode rosetta_code/100_doors/main.c
infercode rosetta_code/100_doors/main.c
sleep 2
echo cat rosetta_code/100_doors/main.c.embedding
cat rosetta_code/100_doors/main.c.embedding
sleep 2
echo 4. A C2Rust example in Rust:
echo infercode rosetta_code/100_doors/rust_c2rust/src/main.rs 
infercode rosetta_code/100_doors/rust_c2rust/src/main.rs 
echo cat rosetta_code/100_doors/rust_c2rust/src/main.rs.embedding
cat rosetta_code/100_doors/rust_c2rust/src/main.rs.embedding
sleep 2
echo 5. A CRustS example in Rust:
echo infercode rosetta_code/100_doors/rust_crusts/src/main.rs
infercode rosetta_code/100_doors/rust_crusts/src/main.rs
echo cat rosetta_code/100_doors/rust_crusts/src/main.rs.embedding
cat rosetta_code/100_doors/rust_crusts/src/main.rs.embedding
sleep 2
echo infercode can compare similarity of code regardless of programming languages, e.g., C or Rust.
echo 6. The cosine similarity among them:
echo infercode rosetta_code/100_doors/main.c rosetta_code/100_doors/rust_crusts/src/main.rs
infercode rosetta_code/100_doors/main.c rosetta_code/100_doors/rust_crusts/src/main.rs
sleep 2
echo infercode rosetta_code/100_doors/main.c rosetta_code/100_doors/rust_c2rust/src/main.rs
infercode rosetta_code/100_doors/main.c rosetta_code/100_doors/rust_c2rust/src/main.rs
sleep 2
echo infercode rosetta_code/100_doors/rust_crusts/src/main.rs rosetta_code/100_doors/rust_c2rust/src/main.rs
infercode rosetta_code/100_doors/rust_crusts/src/main.rs rosetta_code/100_doors/rust_c2rust/src/main.rs
sleep 2
echo 7. The cosine similarity between different algorithms in Rust:
echo infercode rosetta_code/100_doors/rust_c2rust/src/main.rs abc/src/main.rs
infercode rosetta_code/100_doors/rust_c2rust/src/main.rs abc/src/main.rs
echo The End
sleep 10
