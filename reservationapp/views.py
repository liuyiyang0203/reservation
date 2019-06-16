from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def index(request):
    return render(request, 'reservationapp/index.html')
def index1(request):
    return render(request, 'reservationapp/index1.html')
def index2(request):
    return render(request, 'reservationapp/index2.html')