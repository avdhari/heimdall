from django.contrib import admin
from heimdall.athena.models import ScrapedData, ProductInsight, AttributeHitScore


@admin.register(ScrapedData)
class ScrapedDataAdmin(admin.ModelAdmin):
    list_display = ['title', 'generated_on']


@admin.register(ProductInsight)
class ProductInsightAdmin(admin.ModelAdmin):
    list_display = ['product', 'production_capacity', 'sales']


@admin.register(AttributeHitScore)
class AttributeExtractAdmin(admin.ModelAdmin):
    list_display = ['product', 'hit_rate', 'generated_on']