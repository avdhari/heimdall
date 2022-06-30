from django import forms
from heimdall.athena.models import ScrapedData, NewRate
from heimdall.users.models import Product


class NewDataForm(forms.ModelForm):
    class Meta:
        model = ScrapedData
        fields = ('product', 'source')

    def __init__(self, *args, **kwargs):
        cmp_id = kwargs.pop('cmp_id')
        super(NewDataForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.filter(company_id=cmp_id)


class NewRateForm(forms.ModelForm):
    class Meta:
        model = NewRate
        fields = ('product', 'production_capacity', 'produced', 'month', 'year', 'sales', 'hit_rate')

    def __init__(self, *args, **kwargs):
        cmp_id = kwargs.pop('cmp_id')
        super(NewRateForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.filter(company_id=cmp_id)
