# Generated by Django 2.0.4 on 2018-05-10 09:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('djangoapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='membership',
            unique_together={('member', 'team')},
        ),
    ]
