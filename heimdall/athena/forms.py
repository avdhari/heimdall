from django import forms
from heimdall.athena.models import ScrapedData


class NewDataForm(forms.ModelForm):
    class Meta:
        model = ScrapedData
        fields = ('product', 'source')
