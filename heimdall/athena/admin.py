from django.contrib import admin
from heimdall.athena.models import ScrapedData, ProductInsight, AttributeExtract


@admin.register(ScrapedData)
class ScrapedDataAdmin(admin.ModelAdmin):
    list_display = ['title', 'generated_on']


@admin.register(ProductInsight)
class ProductInsightAdmin(admin.ModelAdmin):
    list_display = ['product', 'production_capacity', 'sales']