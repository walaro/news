from django.db import models
from django.contrib.auth.models import User


class AuthorProfile(models.Model):
    author = models.ForeignKey(User)
    signature = models.CharField(max_length=256)

