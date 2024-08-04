from rest_framework import serializers
from .models import Paciente, Profissional, Vacinacao, Consulta, Avisos

# Serializers define the API representation.
# class AdministradorSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Administrador
#         fields = ['cnpj', 'senha', 'status']


class PacienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paciente
        fields = ['nome', 'cpf', 'numTelefone', 'dataNascimento', 'senha', 'statusPaciente', 'status']
        extra_kwargs = {'senha': {'write_only': True}}

class ProfissionalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profissional
        fields = ['nome', 'especialidade', 'cpf', 'numTelefone', 'horaAtendimento', 'status']

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