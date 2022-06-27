from django.db import models
from heimdall.users.models import Product
from django.core.validators import MaxValueValidator

from heimdall.athena.utils import get_raw_data, get_text_data, get_title


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

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.title = get_title(self.source)
        self.raw_data = get_raw_data(self.source)
        self.text_data = get_text_data(self.source)
        super(ScrapedData, self).save(*args, **kwargs)


class ProductInsight(BaseModel):

    MONTH = [
        ('January', 'January'),
        ('February', 'February'),
        ('March', 'March'),
        ('April', 'April'),
        ('May', 'May'),
        ('June', 'June'),
        ('July', 'July'),
        ('August', 'August'),
        ('September', 'September'),
        ('October', 'October'),
        ('November', 'November'),
        ('December', 'December'),
    ]

    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    production_capacity = models.PositiveBigIntegerField()
    month = models.CharField(max_length=15, choices=MONTH)
    year = models.PositiveBigIntegerField(validators=[MaxValueValidator(2100)])
    sales = models.PositiveBigIntegerField()

    def __str__(self):
        return self.product.name + " | " + str(self.month) + " - " + str(self.year)


class AttributeHitScore(BaseModel):
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    hit_rate = models.FloatField()
    generated_on = models.DateTimeField(auto_now_add=True)
