from django.urls import re_path

from plugins.{{short_name}} import views


urlpatterns = [
    re_path(r'^manager/$', views.manager, name='{{short_name}}_manager'),
]

