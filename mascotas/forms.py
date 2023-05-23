from django import forms
from .models import Mascota


class MascotaForm(forms.ModelForm):
    class Meta:
        model = Mascota
        fields = ['nombre', 'edad', 'foto', 'persona', 'vacuna']
        # fields = '__all__'

        labels = {
            'nombre': 'Nombre',
            'edad': 'Edad',
            'foto': 'Foto',
            'persona': 'Dueño de la mascota',
            'vacuna': 'Vacuna',
        }

        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'edad': forms.NumberInput(attrs={'class': 'form-control'}),
            'foto': forms.FileInput(attrs={'class': 'form-control'}),
            'persona': forms.Select(attrs={'class': 'form-control'}),
            'vacuna': forms.CheckboxSelectMultiple()
        }
