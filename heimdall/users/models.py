from django.contrib.auth.models import AbstractUser
from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.utils.text import slugify


class BaseModel(models.Model):
    is_removed = models.BooleanField(default=False)

    class Meta:
        abstract = True
        app_label = 'users'


class CompanyAdmin(BaseModel):
    """Admin of the client company"""
    name = models.CharField(max_length=200)
    mail = models.EmailField()
    company_mail = models.EmailField()
    company_owned = models.ForeignKey("Company", on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name


class Company(BaseModel):
    name = models.CharField(max_length=255, unique=True)
    company_admin = models.ForeignKey(CompanyAdmin, on_delete=models.CASCADE)
    site_url = models.URLField()
    contact_mail = models.EmailField()
    admin_mail = models.EmailField()
    is_paid = models.BooleanField(default=False)
    expires_on = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey("User", on_delete=models.SET_NULL, null=True,
                                   blank=True,
                                   related_name='added_company')

    def __str__(self):
        return self.name


class User(AbstractUser):
    """Default user for heimdall."""

    #: First and last name do not cover name patterns around the globe
    name = models.CharField(_("Name of User"), blank=True, max_length=255)
    first_name = None  # type: ignore
    last_name = None  # type: ignore
    company_mail = models.EmailField(null=True)
    is_company_admin = models.BooleanField(default=False)
    company = models.ForeignKey(Company, on_delete=models.PROTECT, null=True)
    phone = models.CharField(max_length=12, null=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        """Get url for user's detail view.
        Returns: str -  URL for user detail.
        """
        return reverse("users:detail", kwargs={"username": self.username})


class Product(BaseModel):
    name = models.CharField(max_length=255)
    company = models.ForeignKey(Company, on_delete=models.PROTECT, null=True)
    description = models.TextField(null=True)
    product_site_url = models.URLField(null=True, blank=True)
    keywords = models.TextField(null=True)
    slug = models.SlugField(null=True, blank=True)

    def __str__(self):
        return self.name + " | " + str(self.company)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)


class ProductKeyword(BaseModel):
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    company = models.ForeignKey(Company, on_delete=models.PROTECT)
    keywords = models.TextField()

    def __str__(self):
        return str(self.product)
