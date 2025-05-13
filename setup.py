import os
from setuptools import setup

source_folders = [
    "util",
    "obj",
    "util/prompts"
]

project_folder = "repeticio_backend"

source_folders = [
    os.path.join(project_folder, folder) for folder in source_folders
]

setup(name="repeticio_backend",
        version="0.1",
        description="Backend for language learning app",
        author="Oscar Fernandes",
        author_email="oscarthf@gmail.com",
        packages=source_folders)