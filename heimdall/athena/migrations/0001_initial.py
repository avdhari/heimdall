# Generated by Django 3.2.12 on 2022-05-11 15:51

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ScrapedData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_removed', models.BooleanField(default=False)),
                ('title', models.CharField(max_length=255)),
                ('source', models.CharField(max_length=300)),
                ('raw_data', models.TextField()),
                ('text_data', models.TextField()),
                ('generated_on', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
