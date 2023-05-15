from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import mascota
from .forms import MascotaForm
# Create your views here.


def inicio(request):
    return render(request, 'paginas/inicio.html')


def nosotros(request):
    return render(request, 'paginas/nosotros.html')


def mascotas(request):
    mascotas = mascota.objects.all()
    # print(mascotas)
    return render(request, 'mascotas/index.html', {'mascotas': mascotas})


def crear(request):
    formulario = MascotaForm(request.POST or None, request.FILES or None)
    if formulario.is_valid():
        formulario.save()
        return redirect('mascotas')
    return render(request, 'mascotas/crear.html', {"formulario": formulario})


def editar(request, id):
    mascotas = mascota.objects.get(id=id)
    formulario = MascotaForm(request.POST or None,
                             request.FILES or None, instance=mascotas)
    if formulario.is_valid():
        formulario.save()
        return redirect('mascotas')
    return render(request, 'mascotas/editar.html', {"formulario": formulario})


def eliminar(request, id):
    mascotas = mascota.objects.get(id=id)
    mascotas.delete()
    return redirect('mascotas')
