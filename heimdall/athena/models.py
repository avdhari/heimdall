from django.db import models


class BaseModel(models.Model):
    is_removed = models.BooleanField(default=False)

    class Meta:
        abstract = True
        app_label = 'athena'
