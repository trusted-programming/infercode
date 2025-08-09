pip install sentencepiece
pip install dpu_utils
pip install tree_sitter
pip install bidict
pip install tensorflow
for f in tree-sitter-asm-0.0.1 tree-sitter-c-0.19.0 tree-sitter-cpp-0.19.0 tree-sitter-c-sharp-0.19.0 tree-sitter-kotlin-0.2.6 tree-sitter-rust-0.19.1; do
	rm -rf ~/.tree-sitter/bin/$f
done
python test.py
