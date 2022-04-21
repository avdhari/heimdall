from django.urls import path
from heimdall.athena.views import home_view


urlpatterns = [
    path("", home_view, name="scraper-home"),
]
