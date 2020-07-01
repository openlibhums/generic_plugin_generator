from django.shortcuts import render

from plugins.{{short_name}} import forms


def manager(request):
    form = forms.DummyManagerForm()

    template = '{{short_name}}/manager.html'
    context = {
        'form': form,
    }

    return render(request, template, context)

