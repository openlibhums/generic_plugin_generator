from django.conf.urls import url

from plugins.{{short_name}} import views


urlpatterns = [
    url(r'^manager/$', views.manager, name='{{short_name}}_manager'),
]

