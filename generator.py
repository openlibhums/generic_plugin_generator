import os
import shutil

from jinja2 import Environment, FileSystemLoader
env = Environment(loader=FileSystemLoader('templates'))

BASE_DIR = os.getcwd()
FILES_TO_CREATE = [
    {'name': 'plugin_settings.py', 'template': 'plugin_settings.tpl'},
    {'name': 'views.py', 'template': 'views.tpl'},
    {'name': 'urls.py', 'template': 'urls.tpl'},
    {'name': 'models.py', 'template': 'empty.tpl'},
    {'name': 'forms.py', 'template': 'forms.tpl'},
    {'name': '__init__.py', 'template': 'empty.tpl'},
    {'name': 'manager.html', 'template': 'manager.tpl', 'path': 'templates'},
]


def save_file(contents, path_parts, file_name):
    path = os.path.join(
        BASE_DIR,
        *path_parts,
    )
    file_path = os.path.join(path, file_name)

    if not os.path.exists(path):
        os.makedirs(path)

    with open(file_path, 'w') as f:
        f.write(contents)
        f.close()


def generate_files(settings):
    for file in FILES_TO_CREATE:
        template = env.get_template(file.get('template'))
        contents = template.render(settings)
        path_parts = [settings.get('short_name')]

        if file.get('path', '') == 'templates':
            path_parts.append('templates')
            path_parts.append(settings.get('short_name'))

        save_file(
            contents,
            path_parts,
            file.get('name')
        )


def nuke_folders():
    try:
        shutil.rmtree(os.path.join(BASE_DIR, 'test'))
    except FileNotFoundError:
        pass


author = input('What is your name? ')
description = input('Give me a short description of this plugin: ')
display_name = input('Plugin display name eg. Typesetting. ')
short_name = input('Short name of the plugin eg. typesetting. ')
workflow_plugin = input('Is this plugin a Workflow Element? y/n: ')
is_workflow_plugin = True if workflow_plugin == 'y' else False

settings = {
    'author': author,
    'description': description,
    'short_name': short_name,
    'display_name': display_name,
    'is_workflow_plugin': is_workflow_plugin
}

nuke_folders()
generate_files(settings)
