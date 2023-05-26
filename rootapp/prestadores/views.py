from django.shortcuts import render


def prueba(request):
    return render(request, 'prueba.html', {})


def about(request):
    return render(request, 'about.html', {})

def contact(request):
    return render(request, 'contact-us.html', {})

def typography(request):
    return render(request, 'typography.html', {})