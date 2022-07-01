import os
from django.shortcuts import render, redirect
from django.conf import settings

from heimdall.athena.forms import NewDataForm, NewRateForm
from heimdall.athena.utils import get_raw_data
from heimdall.athena.models import ScrapedData, NewRate
from heimdall.users.ml_utils import get_new_rate

import numpy as np


def home_view(request):
    if request.method == "POST":
        new_data_form = NewDataForm(request.POST, cmp_id=request.user.company_id)
        if new_data_form.is_valid():

            new_data_form.save()
            return redirect('/')
    new_data_form = NewDataForm(cmp_id=request.user.company_id)
    scraped_datas = ScrapedData.objects.all()
    context = {
        'new_data_form': new_data_form,
        'scraped_datas': scraped_datas,
    }
    return render(request, 'athena/home.html', context)


def data_detail(request, pk):
    data_instance = ScrapedData.objects.get(id=pk)
    context = {
        'data_instance': data_instance
    }
    return render(request, 'athena/data_detail.html', context)


def predict_view(request):
    if request.method == "POST":
        new_rate_form = NewRateForm(request.POST, cmp_id=request.user.company_id)
        if new_rate_form.is_valid():
            new_rate_form.save()
            return redirect('/')

    new_rate_form = NewRateForm(cmp_id=request.user.company_id)
    prod_rates = NewRate.objects.all().order_by('-generated_on')
    context = {
        "new_rate_form": new_rate_form,
        'prod_rates': prod_rates,
    }

    return render(request, 'athena/new_rate_form.html', context)
