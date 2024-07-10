from django.shortcuts import render
from rest_framework import viewsets
from .models import Administrador, Paciente, Profissional, Vacinacao, Consulta, Avisos
from .serializers import AdministradorSerializer, PacienteSerializer, ProfissionalSerializer, VacinacaoSerializer, ConsultaSerializer, AvisosSerializer

# Create your views here.
class AdministradorViewSet(viewsets.ModelViewSet):
    queryset = Administrador.objects.all()
    serializer_class = AdministradorSerializer

class PacienteViewSet(viewsets.ModelViewSet):
    queryset = Paciente.objects.all()
    serializer_class = PacienteSerializer

class ProfissionalViewSet(viewsets.ModelViewSet):
    queryset = Profissional.objects.all()
    serializer_class = ProfissionalSerializer

class VacinacaoViewSet(viewsets.ModelViewSet):
    queryset = Vacinacao.objects.all()
    serializer_class = VacinacaoSerializer

class ConsultaViewSet(viewsets.ModelViewSet):
    queryset = Consulta.objects.all()
    serializer_class = ConsultaSerializer

class AvisosViewSet(viewsets.ModelViewSet):
    queryset = Avisos.objects.all()
    serializer_class = AvisosSerializer

