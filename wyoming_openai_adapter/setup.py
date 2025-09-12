from setuptools import setup, find_packages

setup(
    name="wyoming_openai_adapter",
    version="0.3.7",
    description="OpenAI-Compatible Proxy Middleware for the Wyoming Protocol - Home Assistant Addon",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    python_requires=">=3.11",
    install_requires=[
        "openai==1.107.0",
        "wyoming==1.7.2", 
        "pysbd==0.3.4"
    ],
)