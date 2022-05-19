from django.db import models
from heimdall.users.models import Product


class BaseModel(models.Model):
    is_removed = models.BooleanField(default=False)

    class Meta:
        abstract = True
        app_label = 'athena'


class ScrapedData(BaseModel):
    """Model to store web scraped data"""
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    title = models.CharField(max_length=255)
    source = models.CharField(max_length=300)
    raw_data = models.TextField()
    text_data = models.TextField()
    generated_on = models.DateTimeField(auto_now_add=True)

