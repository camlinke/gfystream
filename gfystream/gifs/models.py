from django.db import models


class GIF(models.Model):
    url = models.URLField()
    approved = models.BooleanField(default=False)
