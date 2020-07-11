from setuptools import setup

setup(name='pangeoLib',
      maintainer='Tony Butzer',
      maintainer_email='tonybutzer@gmail.com',
      version='1.0.3',
      description='helper functions for pangeo envirinment jupyter ',
      packages=[
          'pangeoLib',
      ],
      install_requires=[
          'boto3',
      ],

)

