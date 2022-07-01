from django.urls import path

from heimdall.users.views import (
    user_detail_view,
    user_redirect_view,
    user_update_view,
    product_view,
    new_product_view,
    new_keyword_view,
    edit_keyword_view
)
from heimdall.users import views

app_name = "users"
urlpatterns = [
    path("new-product/", view=new_product_view, name="new-product"),
    path("new-keywords/", view=new_keyword_view, name="new-keywords"),
    path("edit-keywords/<int:pk>/", view=edit_keyword_view, name="edit-keywords"),
    path("~redirect/", view=user_redirect_view, name="redirect"),
    path("~update/", view=user_update_view, name="update"),
    path("<str:username>/", view=user_detail_view, name="detail"),
    path("products/<str:slug>/", view=product_view, name="product-detail"),

]
