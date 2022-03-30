from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.utils.translation import gettext_lazy as _

from heimdall.users.forms import UserChangeForm, UserCreationForm
from heimdall.users.models import User, CompanyAdmin, Company, Product, ProductKeyword


@admin.register(User)
class UserAdmin(auth_admin.UserAdmin):

    form = UserChangeForm
    add_form = UserCreationForm
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (_("Personal info"), {"fields": ("name", "email", "company", "is_company_admin", "company_mail", "phone")}),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )
    list_display = ["username", "name", "company", "is_superuser", ]
    search_fields = ["name"]


@admin.register(CompanyAdmin)
class CompanyAdminAdmin(admin.ModelAdmin):
    list_display = ['name', 'company_owned', 'company_mail', 'is_removed', ]


@admin.register(Company)
class CompanyAdmin(admin.ModelAdmin):
    list_display = ['name', 'company_admin', 'is_paid', 'contact_mail', 'admin_mail', 'is_removed', ]


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'company', 'product_site_url', 'is_removed', ]


@admin.register(ProductKeyword)
class ProductKeywordAdmin(admin.ModelAdmin):
    list_display = ['product', 'company', ]