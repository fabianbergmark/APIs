from setuptools import setup

setup(name='APIs',
      version='0.1',
      description='APIs python FFI library',
      url='https://github.com/fabianbergmark/APIs',
      author='Fabian Bergmark',
      author_email='fabian.bergmark@gmail.com',
      license='BSD2',
      packages=['APIs'],
      package_data={'': ['LICENCE'], 'APIs': ['_APIs.so']},
      include_package_data=True,
      zip_safe=False)
