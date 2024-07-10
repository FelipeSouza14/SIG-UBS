from rest_framework import serializers
from .models import Administrador, Paciente, Profissional, Vacinacao, Consulta, Avisos

# Serializers define the API representation.
class AdministradorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Administrador
        fields = ['id', 'cnpj', 'senha', 'status']


class PacienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paciente
        fields = ['id', 'nome', 'cpf', 'numTelefone', 'dataNascimento', 'senha', 'status']

class ProfissionalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profissional
        fields = ['id', 'nome', 'especialidade', 'cpf', 'numTelefone', 'horaAtendimento', 'status']

class VacinacaoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vacinacao
        fields = ['id', 'nomeVacina', 'data', 'horario', 'publicoAlvo', 'status']

class ConsultaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consulta
        fields = ['id', 'nomePaciente', 'nomeProfissional', 'data', 'horario', 'tipoAtendimento', 'status']

class AvisosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Avisos
        fields = ['id', 'titulo', 'descricao', 'dataEnvio', 'status']