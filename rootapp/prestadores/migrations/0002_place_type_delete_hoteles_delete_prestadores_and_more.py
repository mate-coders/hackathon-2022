# Generated by Django 4.2.1 on 2023-05-26 00:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prestadores', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Place',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('address', models.CharField(max_length=80)),
                ('latitude', models.FloatField()),
                ('longitude', models.FloatField()),
                ('rating', models.FloatField()),
                ('users_rating', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Type',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.DeleteModel(
            name='Hoteles',
        ),
        migrations.DeleteModel(
            name='Prestadores',
        ),
        migrations.AddField(
            model_name='place',
            name='types',
            field=models.ManyToManyField(to='prestadores.type'),
        ),
    ]