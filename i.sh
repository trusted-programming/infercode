sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 python3.9-venv python3.9-dev
python3.9 -m venv 3.9
source 3.9/bin/activate
pip install --upgrade pip
pip install sentencepiece
pip install dpu_utils
pip install tree_sitter==0.19.0
pip install bidict
pip install tensorflow==2.5.0
pip install typing-extensions --upgrade
for f in tree-sitter-asm-0.0.1 tree-sitter-c-0.19.0 tree-sitter-cpp-0.19.0 tree-sitter-c-sharp-0.19.0 tree-sitter-kotlin-0.2.6 tree-sitter-rust-0.19.1; do
	rm -rf ~/.tree-sitter/bin/$f
done
pip install tree-sitter-parsers
python test.py
