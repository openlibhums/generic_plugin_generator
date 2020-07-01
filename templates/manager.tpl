{% raw %}{% extends "admin/core/base.html" %}
{% load foundation %}{% endraw %}

{% raw %}{% block title %}{% endraw %}{{ display_name }} Manager{% raw %}{% endblock %}{% endraw %}

{% raw %}{% block body %}{% endraw %}
<div class="box">
    <div class="title-area">
        <h2>Management Form</h2>
    </div>
    <div class="content">
        {% raw %}{{ form|foundation }}{% endraw %}
    </div>
</div>
{% raw %}{% endblock body %}{% endraw %}