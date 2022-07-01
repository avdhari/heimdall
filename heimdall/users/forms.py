from django.contrib.auth import forms as admin_forms
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _
from django import forms
from heimdall.users.models import Product, Company, ProductKeyword

User = get_user_model()


class UserChangeForm(admin_forms.UserChangeForm):
    class Meta(admin_forms.UserChangeForm.Meta):
        model = User


class UserCreationForm(admin_forms.UserCreationForm):
    class Meta(admin_forms.UserCreationForm.Meta):
        model = User

        error_messages = {
            "username": {"unique": _("This username has already been taken.")}
        }


class NewProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ('company', 'name', 'description', 'product_site_url', 'keywords')

    def __init__(self, *args, **kwargs):
        cmp_id = kwargs.pop('cmp_id')
        super(NewProductForm, self).__init__(*args, **kwargs)
        self.fields['company'].queryset = Company.objects.filter(id=cmp_id)


class NewProductKeywordForm(forms.ModelForm):
    class Meta:
        model = ProductKeyword
        fields = ('product', 'company', 'keywords')

    def __init__(self, *args, **kwargs):
        cmp_id = kwargs.pop('cmp_id')
        super(NewProductKeywordForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.filter(company_id=cmp_id)
        self.fields['company'].queryset = Company.objects.filter(id=cmp_id)


class EditKeywordsForm(forms.ModelForm):
    class Meta:
        model = ProductKeyword
        fields = ('keywords',)
    
    def __init__(self, *args, **kwargs):
        super(EditKeywordsForm, self).__init__(*args, **kwargs)
        product_keywords = kwargs.pop('instance')
        self.fields['keywords'].queryset = ProductKeyword.objects.get(id=product_keywords.id)
    