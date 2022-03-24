from django.urls import path

from heimdall.users.views import (
    user_detail_view,
    user_redirect_view,
    user_update_view,
    product_view,
)

app_name = "users"
urlpatterns = [
    path("~redirect/", view=user_redirect_view, name="redirect"),
    path("~update/", view=user_update_view, name="update"),
    path("<str:username>/", view=user_detail_view, name="detail"),
    path("products/<int:pk>/", view=product_view, name="product-detail"),

]
