import tree_sitter_parsers
import os
import warnings
warnings.filterwarnings("ignore")
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
import tensorflow as tf
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)
import sys
from pathlib import Path
sys.path.append(str(Path('.').absolute().parent))
from infercode.client.infercode_client import InferCodeClient
import argparse
import logging
logging.basicConfig(level=logging.INFO)
logging.getLogger('InferCodeModel').propagate = False
logging.getLogger('InferCodeTrainer').propagate = False
# Change from -1 to 0 to enable GPU
os.environ['CUDA_VISIBLE_DEVICES'] = "-1"
import numpy as np

language = {
    ".c": "c",
    ".cs": "c_sharp",
    ".cc": "cpp",
    ".cpp": "cpp",
    ".css": "css",
    ".elm": "elm",
    ".go": "go",
    ".html": "html",
    ".hs": "haskell",
    ".java": "java",
    ".js": "javascript",
    ".kt": "kotlin",
    ".lua": "lua",
    ".php": "php",
    ".py": "python",
    ".rb": "ruby",
    ".rs": "rust",
    ".scala": "scala",
    ".sol": "solidity",
    ".sh": "bash",
    ".v": "verilog",
    ".yaml": "yaml",
    ".yml": "yaml",
}

# Load embeddings from a text file
def load_embedding(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
        embeddings = []
        for line in lines:
            line = line.strip('[] \n\r')
            # Split the line by spaces and convert to float
            vector = [float(num) for num in line.strip().split()]
            embeddings.extend(vector)
    return embeddings

def similarity(file1, file2):
    embedding1 = load_embedding(file1)
    embedding2 = load_embedding(file2)

    # Convert lists to NumPy arrays
    vec1 = np.array(embedding1)
    vec2 = np.array(embedding2)

    # Compute the dot product
    dot_product = np.dot(vec1, vec2)

    # Compute the L2 norms
    norm1 = np.linalg.norm(vec1)
    norm2 = np.linalg.norm(vec2)

    # Compute cosine similarity
    cosine_similarity = dot_product / (norm1 * norm2)

    print(f"Cosine Similarity: {cosine_similarity:.4f}")
    return cosine_similarity

def main(): 
    parser = argparse.ArgumentParser()
    parser.add_argument('-s', "--similarity", action="store_true", help="show similarity")
    parser.add_argument('files', metavar='code', nargs='+', help='a file for the conversion')
    args = parser.parse_args()
    if args.similarity and len(args.files)==2:
        similarity(args.files[0] + ".embedding", args.files[1] + ".embedding")
    else:
        for file in args.files:
            filename, file_extension = os.path.splitext(file)
            infercode = InferCodeClient(language=language[file_extension])
            infercode.init_from_config()
            with open (file, "r") as myfile:
                code=myfile.read()
                logging.getLogger('tensorflow').propagate = False
                vectors = infercode.encode([code])
                print(vectors)
if __name__ == '__main__':
    main()
