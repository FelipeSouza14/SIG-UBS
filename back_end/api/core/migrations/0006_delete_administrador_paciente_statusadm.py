# Generated by Django 5.0.7 on 2024-08-04 23:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_alter_paciente_options_alter_paciente_managers_and_more'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Administrador',
        ),
        migrations.AddField(
            model_name='paciente',
            name='statusAdm',
            field=models.BooleanField(default=False),
        ),
    ]
