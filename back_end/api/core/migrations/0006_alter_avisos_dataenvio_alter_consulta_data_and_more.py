# Generated by Django 5.0.4 on 2024-08-14 03:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_consulta_idpaciente_profissional_imagem'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avisos',
            name='dataEnvio',
            field=models.CharField(max_length=15),
        ),
        migrations.AlterField(
            model_name='consulta',
            name='data',
            field=models.CharField(max_length=15),
        ),
        migrations.AlterField(
            model_name='vacinacao',
            name='data',
            field=models.CharField(max_length=15),
        ),
    ]
