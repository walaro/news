# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-12-08 14:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='articletag',
            name='article',
        ),
        migrations.RemoveField(
            model_name='articletag',
            name='tag',
        ),
        migrations.RemoveField(
            model_name='article',
            name='tags',
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.TextField(default='asd'),
            preserve_default=False,
        ),
        migrations.DeleteModel(
            name='Tag',
        ),
    ]
