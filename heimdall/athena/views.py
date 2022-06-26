from django.shortcuts import render, redirect

from heimdall.athena.forms import NewDataForm
from heimdall.athena.utils import get_raw_data
from heimdall.athena.models import ScrapedData


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
