from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.views import generic

from heimdall.users.models import User, Company, Product, ProductKeyword  # noqa


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

    def get_context_data(self, **kwargs):
        context = super(ProductView, self).get_context_data(**kwargs)
        keywords = ProductKeyword.objects.get(product_id=self.object.id).keywords
        context['keywords'] = keywords.split('\n')
        return context


product_view = ProductView.as_view()
