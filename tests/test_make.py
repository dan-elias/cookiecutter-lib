from contextlib import suppress
import json, pathlib, shutil, subprocess
import unittest

paths = {'tests': pathlib.Path(__file__).parent}
paths['project_root'] = paths['tests'].parent

with paths['project_root'].joinpath('cookiecutter.json').open('r') as in_stream:
    cookiecutter_args = json.load(in_stream)
paths['build'] = paths['project_root']/cookiecutter_args['app_name']
paths['build_code'] = paths['build']/cookiecutter_args['app_name']

class Test_make(unittest.TestCase):
    @classmethod
    def shell_cmd(cls, cmd):
        return subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE, cwd=paths['build'])
    @classmethod
    def setUpClass(cls):
        with suppress(FileNotFoundError):
            shutil.rmtree(paths['build'])
        subprocess.run('cookiecutter --no-input .', shell=True, check=True, cwd=paths['project_root'])
        cls.shell_cmd('./initialize.sh --test')
    @classmethod
    def tearDownClass(cls):
        with suppress(FileNotFoundError):
            shutil.rmtree(paths['build'])
    def test_update_docs(self):
        self.shell_cmd('./update_docs.sh --test')
        html_build = paths['build']/'docs/build/html'
        self.assertTrue(html_build.joinpath('code_pages/example.html').exists())
        html_build_index = html_build/'index.html'
        self.assertTrue(html_build_index.exists())
        with html_build_index.open('r') as in_stream:
            index_html = in_stream.read()
        self.assertTrue('<li class="toctree-l1"><a class="reference internal" href="introduction.html">Introduction</a></li>' in index_html)
        self.assertTrue('<li class="toctree-l1"><a class="reference internal" href="code_pages/example.html">Example module</a></li>' in index_html)
        self.assertTrue('<li class="toctree-l1"><a class="reference internal" href="contributing.html">Contributing</a></li>' in index_html)
    def test_new_module(self):
        self.shell_cmd('./new_module.sh pkg1.mod1')
        self.assertTrue(paths['build_code'].joinpath('pkg1').exists())
        self.assertTrue(paths['build_code'].joinpath('pkg1/__init__.py').exists())
        self.assertTrue(paths['build_code'].joinpath('pkg1/mod1.py').exists())
        self.assertTrue(paths['build'].joinpath('tests/pkg1/__init__.py').exists())
        self.assertTrue(paths['build'].joinpath('tests/pkg1/test_mod1.py').exists())
        self.assertTrue(paths['build'].joinpath('docs/source/code_pages/pkg1.mod1.rst').exists())


if __name__ == '__main__':
    unittest.main()
