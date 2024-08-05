from rest_framework import serializers
from .models import CustomUser, Profissional, Vacinacao, Consulta, Avisos

# Serializers define the API representation.
# class AdministradorSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Administrador
#         fields = ['cnpj', 'senha', 'status']


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['nome', 'cpf', 'numTelefone', 'dataNascimento', 'password', 'isUser', 'isAdm', 'status']

    def create(self, validated_data):
        user = CustomUser.objects.create(
            nome=validated_data['nome'],
            cpf=validated_data['cpf'],
            numTelefone=validated_data['numTelefone'],
            dataNascimento=validated_data['dataNascimento'],
            isUser=validated_data['isUser'],
            isAdm=validated_data['isAdm'],
            status=validated_data['status'],
        )
        user.set_password(validated_data['password'])
        user.save()
        return user

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