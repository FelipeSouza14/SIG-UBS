from django.shortcuts import render
from rest_framework import viewsets
from .models import Administrador, Paciente, Profissional, Vacinacao, Consulta, Avisos
from .serializers import AdministradorSerializer, PacienteSerializer, ProfissionalSerializer, VacinacaoSerializer, ConsultaSerializer, AvisosSerializer

# Viwes usadas para a autenticação de usuário
# from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username # Criptografa no token o nome do usuário

        return token
    
class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer
    


@api_view(['GET'])
def getRoutes(request):
    routes = [
        '/api/token',
        'api/token/refresh'
    ]

    return Response(routes)


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

