from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MinLengthValidator

# Modelo para atutenticação de usuário(Paciente)
class CustomUser(AbstractUser): # Antiga Tabela Pacientes
    username = models.CharField(max_length=255)
    cpf = models.CharField(max_length=11, primary_key=True, unique=True)
    numTelefone = models.CharField(max_length=11, unique=True)
    dataNascimento = models.CharField(max_length=15)
    password = models.CharField(max_length=50, validators=[MinLengthValidator(8)])
    isUser = models.BooleanField(default=True)
    isAdm = models.BooleanField(default=False)
    status = models.BooleanField(default=True)

    USERNAME_FIELD = 'cpf'
    REQUIRED_FIELDS = ['username']


    def __str__(self):
        return self.cpf


# Modelos do Banco de Dados
# class Administrador(models.Model):
#     cnpj = models.CharField(max_length=14, primary_key=True, unique=True)
#     senha = models.CharField(max_length=50, validators=[MinLengthValidator(8)])
#     status = models.BooleanField(default=True)

#     def __str__(self):
#         return self.cnpj


class Profissional(models.Model):
    nome = models.CharField(max_length=255)
    especialidade = models.CharField(max_length=255)
    cpf = models.CharField(max_length=11, primary_key=True, unique=True)
    numTelefone = models.CharField(max_length=11, unique=True)
    horaAtendimento = models.CharField(max_length=50)
    imagem = models.CharField(max_length=255)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.cpf
    
class Vacinacao(models.Model):
    nomeVacina = models.CharField(max_length=105)
    data = models.CharField(max_length=15)
    horario = models.CharField(max_length=15)
    publicoAlvo = models.CharField(max_length=255)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.nomeVacina
    
class Consulta(models.Model):
    idPaciente = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    nomePaciente = models.CharField(max_length=255)
    nomeProfissional = models.CharField(max_length=255)
    data = models.CharField(max_length=15)
    horario = models.CharField(max_length=15)
    tipoAtendimento = models.CharField(max_length=50)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.nomePaciente
    
class Avisos(models.Model): 
    titulo = models.CharField(max_length=255)
    descricao = models.CharField(max_length=255)
    dataEnvio = models.CharField(max_length=15)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.titulo