# Generated by Django 3.2.12 on 2022-03-20 17:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0005_company_is_removed'),
    ]

    operations = [
        migrations.AddField(
            model_name='companyadmin',
            name='is_removed',
            field=models.BooleanField(default=False),
        ),
    ]
