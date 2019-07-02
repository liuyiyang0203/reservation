from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth import logout
from django.contrib.auth import login as auth_login
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
# Create your views here.
def index(request):
    error_msg = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return HttpResponseRedirect('/index1')
        else:
            #
            error_msg = '用户名密码错误'
            return render(request, 'reservationapp/index.html',{'error_msg': error_msg})
    return render(request, 'reservationapp/index.html')

@login_required
def index1(request):
    return render(request, 'reservationapp/index1.html')

@login_required
def index2(request):
    return render(request, 'reservationapp/index2.html')

@login_required
def index3(request):
    return render(request, 'reservationapp/index3.html')

@csrf_exempt
def user_logout(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/index')
    else:
        return HttpResponseRedirect('/index')


