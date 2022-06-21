from django.shortcuts import render

from heimdall.athena.forms import NewDataForm
from heimdall.athena.utils import get_raw_data


def home_view(request):
    return render(request, 'athena/home.html')
