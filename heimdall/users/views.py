from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.views import generic
from django.shortcuts import redirect, render
# from django.http.response import Http404

from heimdall.users.models import User, Company, Product, ProductKeyword  # noqa
from heimdall.users.forms import NewProductForm, NewProductKeywordForm

class AdminMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        user = self.request.user
        return user.is_superuser or user.is_company_admin


class UserDetailView(LoginRequiredMixin, generic.DetailView):

    model = User
    slug_field = "username"
    slug_url_kwarg = "username"


user_detail_view = UserDetailView.as_view()


class UserUpdateView(LoginRequiredMixin, SuccessMessageMixin, generic.UpdateView):

    model = User
    fields = ["name"]
    success_message = _("Information successfully updated")

    def get_success_url(self):
        return self.request.user.get_absolute_url()  # type: ignore [union-attr]

    def get_object(self):
        return self.request.user


user_update_view = UserUpdateView.as_view()


class UserRedirectView(LoginRequiredMixin, generic.RedirectView):

    permanent = False

    def get_redirect_url(self):
        return reverse("users:detail", kwargs={"username": self.request.user.username})


user_redirect_view = UserRedirectView.as_view()


class HomeView(LoginRequiredMixin, generic.ListView):
    model = Product
    template_name = 'users/home.html'

    def get_queryset(self):
        current_user = self.request.user
        queryset = Product.objects.filter(company_id=current_user.company_id)
        return queryset


class ProductView(LoginRequiredMixin, generic.DetailView):
    model = Product 
    template_name = 'users/product_detail.html'
    slug_field = "slug"

    def get_context_data(self, **kwargs):
        context = super(ProductView, self).get_context_data(**kwargs)
        keywords = ProductKeyword.objects.get(product_id=self.object.id).keywords
        context['keywords'] = keywords.split('\n')
        return context


product_view = ProductView.as_view()


def new_product_view(request):
    if request.method == 'POST':
        new_product_form = NewProductForm(request.POST, cmp_id=request.user.company_id)
        new_keyword_form = NewProductKeywordForm(request.POST, cmp_id=request.user.company_id)
        if new_product_form.is_valid():
            new_product_form.save()
            return redirect('new-keywords/')
    new_product_form = NewProductForm(cmp_id=request.user.company_id)
    new_keyword_form = NewProductKeywordForm(cmp_id=request.user.company_id)
    context = {
        "new_product_form": new_product_form,
        "new_keyword_form": new_keyword_form,
    }
    return render(request, 'users/new_product.html', context)


def new_keyword_view(request):
    if request.method == 'POST':
        new_keyword_form = NewProductKeywordForm(request.POST, cmp_id=request.user.company_id)
        if new_keyword_form.is_valid():
            new_keyword_form.save()
            return redirect('/')
    new_keyword_form = NewProductKeywordForm(cmp_id=request.user.company_id)
    context = {
        "new_keyword_form": new_keyword_form,
    }
    return render(request, 'users/new_keyword.html', context)
