from setuptools import setup


setup(
    name='aio-demo',
    version='1.0',
    py_modules=['main'],
    entry_points={
        'console_scripts': ['aio-demo-serve=main:main']
    }
)
