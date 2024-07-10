from django.contrib import admin
from .models import Administrador, Paciente, Profissional, Vacinacao, Consulta, Avisos

# Register your models here.
admin.site.register(Administrador)
admin.site.register(Paciente)
admin.site.register(Profissional)
admin.site.register(Vacinacao)
admin.site.register(Consulta)
admin.site.register(Avisos)