from django.contrib import admin
from heimdall.athena.models import ScrapedData


@admin.register(ScrapedData)
class ScrapedDataAdmin(admin.ModelAdmin):
    list_display = ['title', 'generated_on']
