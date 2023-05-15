from django import forms
from .models import mascota


class MascotaForm(forms.ModelForm):
    class Meta:
        model = mascota
        # fields= ['nombre', 'edad', 'foto', 'vacuna']
        fields = '__all__'
