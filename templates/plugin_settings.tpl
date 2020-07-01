from utils import plugins

PLUGIN_NAME = '{{display_name}} Plugin'
DISPLAY_NAME = '{{display_name}}'
DESCRIPTION = '{{description}}'
AUTHOR = '{{author}}'
VERSION = '0.1'
SHORT_NAME = '{{short_name}}'
MANAGER_URL = '{{short_name}}_manager'
JANEWAY_VERSION = "1.3.8"
{% if is_workflow_plugin %}IS_WORKFLOW_PLUGIN = True
JUMP_URL = '{{short_name}}_article'
HANDSHAKE_URL = '{{short_name}}_articles'
ARTICLE_PK_IN_HANDSHAKE_URL = True
STAGE = '{{short_name}}_plugin'
KANBAN_CARD = '{{short_name}}/elements/card.html'
DASHBOARD_TEMPLATE = '{{short_name}}/elements/dashboard.html'{% endif %}


class {{short_name|capitalize }}Plugin(plugins.Plugin):
    plugin_name = PLUGIN_NAME
    display_name = DISPLAY_NAME
    description = DESCRIPTION
    author = AUTHOR
    short_name = SHORT_NAME
    manager_url = MANAGER_URL

    version = VERSION
    janeway_version = JANEWAY_VERSION
    {% if is_workflow_plugin %}is_workflow_plugin = IS_WORKFLOW_PLUGIN
    stage = STAGE
    handshake_url = HANDSHAKE_URL
    article_pk_in_handshake_url = ARTICLE_PK_IN_HANDSHAKE_URL{% endif %}


def install():
    {{short_name|capitalize }}Plugin.install()


def hook_registry():
    {{short_name|capitalize }}Plugin.hook_registry()


def register_for_events():
    pass

