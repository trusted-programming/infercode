from setuptools import setup, find_packages

setup(
  name = 'infercode',
  py_modules = ['infercode'],
  description = 'Map any code snippet into vector',
  url = 'https://github.com/trusted-programming/infercode/',
  package_dir={"infercode": "infercode"},
  packages=find_packages(where=".", exclude=["tests", "logo", "datasets"]),
  package_data={'infercode': ['configs/*.ini', 'sentencepiece_vocab/*', 'sentencepiece_vocab/node_types/*' , 'sentencepiece_vocab/subtrees/*', 'sentencepiece_vocab/tokens/*' ]},
  include_package_data=True,
  scripts=['./scripts/infercode'],
)
