from setuptools import setup, find_packages

setup(
  name = 'infercode',
  version = "0.0.30",
  py_modules = ['infercode'],
  description = 'Map any code snippet into vector',
  author = 'Nghi D. Q. Bui and Yijun Yu and Lingxiao Jiang',
  author_email = 'bdqnghi@gmail.com',
  license="MIT",
  url = 'https://github.com/trusted-programming/infercode/',
  classifiers = [
    'Development Status :: 3 - Alpha',
    'License :: OSI Approved :: MIT License',
    'Operating System :: OS Independent',
    'Programming Language :: Python :: 3',
    'Intended Audience :: Developers',
  ],
  package_dir={"infercode": "infercode"},
  packages=find_packages(where=".", exclude=["tests", "logo", "datasets"]),
  package_data={'infercode': ['configs/*.ini', 'sentencepiece_vocab/*', 'sentencepiece_vocab/node_types/*' , 'sentencepiece_vocab/subtrees/*', 'sentencepiece_vocab/tokens/*' ]},
  include_package_data=True,
  scripts=['./scripts/infercode'],
)
