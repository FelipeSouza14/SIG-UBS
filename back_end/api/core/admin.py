from django.contrib import admin
from .models import Administrador, Paciente, Profissional, Consulta, Notificacao

# Register your models here.
admin.site.register(Administrador)
admin.site.register(Paciente)
admin.site.register(Profissional)
admin.site.register(Consulta)
admin.site.register(Notificacao)