from django.shortcuts import render, redirect

from heimdall.athena.forms import NewDataForm
from heimdall.athena.utils import get_raw_data


def home_view(request):
    if request.method == "POST":
        new_data_form = NewDataForm(request.POST, cmp_id=request.user.company_id)
        if new_data_form.is_valid():
            new_data_form.save()
            return redirect('/')
    new_data_form = NewDataForm(cmp_id=request.user.company_id)

    context = {
        'new_data_form': new_data_form,
    }
    return render(request, 'athena/home.html', context)
