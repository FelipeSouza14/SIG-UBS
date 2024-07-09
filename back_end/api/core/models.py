from django.db import models
from django.core.validators import MinLengthValidator


# Modelos do Banco de Dados
class Administrador(models.Model):
    cnpj = models.CharField(max_length=14, unique=True)
    senha = models.CharField(max_length=50, validators=[MinLengthValidator(8)])

    def __str__(self):
        return self.cnpj


class Paciente(models.Model):
    nome = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    cpf = models.CharField(max_length=11, unique=True)
    numTelefone = models.CharField(max_length=11, unique=True)
    dataNascimento = models.DateField(max_length=15)
    senha = models.CharField(max_length=50, validators=[MinLengthValidator(8)])

    def __str__(self):
        return self.nome


class Profissional(models.Model):
    nome = models.CharField(max_length=255)
    especialidade = models.CharField(unique=True)
    cpf = models.CharField(max_length=11, unique=True)
    numTelefone = models.CharField(max_length=11, unique=True)
    horaAtendimento = models.CharField(max_length=50)

    def __str__(self):
        return self.nome
    
# class Vacinacao(models.Model):
#     nome = models.CharField(max_length=255)
#     especialidade = models.CharField(unique=True)
#     cpf = models.CharField(max_length=11, unique=True)
#     numTelefone = models.CharField(max_length=11, unique=True)
#     horaAtendimento = models.CharField(max_length=50)

#     def __str__(self):
#         return self.nome
    
class Consulta(models.Model):
    nome = models.CharField(max_length=255)
    data = models.DateField(max_length=15)
    horario = models.CharField(max_length=15)
    tipoAtendimento = models.CharField(max_length=50)

    def __str__(self):
        return self.nome
    
class Notificacao(models.Model):
    titulo = models.CharField(max_length=255)
    descricao = models.CharField(max_length=255)
    dataEnvio = models.DateField(max_length=15)

    def __str__(self):
        return self.nome