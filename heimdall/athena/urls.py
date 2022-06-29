from django.urls import path
from heimdall.athena import views


urlpatterns = [
    path("", views.home_view, name="athena-home"),
    path("data/<int:pk>/", views.data_detail, name="data-detail"),
    path("new-rate/", views.predict_view, name="new-rate"),

]
