from django.shortcuts import render
from rest_framework import viewsets
from .models import CustomUser, Profissional, Vacinacao, Consulta, Avisos
from .serializers import UserSerializer, ProfissionalSerializer, VacinacaoSerializer, ConsultaSerializer, AvisosSerializer

# Viwes usadas para a autenticação de usuário
# from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

from rest_framework import generics

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['cpf'] = user.cpf # Criptografa no token o nome do usuário
        token['username'] = user.username
        token['isUser'] = user.isUser
        token['isAdm'] = user.isAdm

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
# class AdministradorViewSet(viewsets.ModelViewSet):
#     queryset = Administrador.objects.all()
#     serializer_class = AdministradorSerializer

class CreateUserView(generics.CreateAPIView):
    serializer_class = UserSerializer

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