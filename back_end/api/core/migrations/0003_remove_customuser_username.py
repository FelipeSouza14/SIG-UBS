# Generated by Django 5.0.7 on 2024-08-05 18:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_alter_customuser_datanascimento'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customuser',
            name='username',
        ),
    ]
