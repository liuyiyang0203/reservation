from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth import logout
from django.contrib.auth import login as auth_login
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from .models import Notice,RUser,Place,Instrument
from django.core.paginator import Paginator

# Create your views here.
def index(request):
    error_msg = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return HttpResponseRedirect('/index3')
        else:
            error_msg = '用户名密码错误'
            return render(request, 'reservationapp/index.html',{'error_msg': error_msg})
    return render(request, 'reservationapp/index.html')

@login_required
def index1(request):
    place_name = Place.objects.all()
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time = request.POST.get('time', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约场地'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        else:
            a = Notice.objects.filter(place=place, date=date, time=time)
            if a.count() == 0:
                b = Notice(place=place, people=people, date=date, time=time, number=number, remark=remark)
                b.save()
                error_msg = '预约成功'
                # return render(request, 'reservationapp/index1.html', {'error_msg': error_msg})
            else:
                error_msg = '预约失败，该场地在此时段已经被预约'
        return render(request, 'reservationapp/index1.html', {'error_msg': error_msg, 'place_name': place_name})
    return render(request, 'reservationapp/index1.html', {'place_name': place_name})

@login_required
def index2(request):
    instrument_name = Instrument.objects.all()
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time = request.POST.get('time', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约场地'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        else:
            b = Notice.objects.filter(place=place, date=date, time=time)
            if b.count() == 0:
                c = Notice(place=place, people=people, date=date, time=time, number=number, remark=remark)
                c.save()
                error_msg = '预约成功'
                # return render(request, 'reservationapp/index1.html', {'error_msg': error_msg})
            else:
                error_msg = '预约失败，该仪器在此时段已经被预约'
        return render(request, 'reservationapp/index2.html', {'error_msg': error_msg, 'instrument': instrument_name})
    return render(request, 'reservationapp/index2.html', {'instrument': instrument_name})

@login_required
def index3(request):
    e = Notice.objects.all().order_by('-date', 'time')
    paginator = Paginator(e, 10)
    page = request.GET.get('page')
    try:  # 获取某页
        e = paginator.page(page)
    except :  # 如果 page 参数不为正整数，显示第一页
        e = paginator.page(1)
    return render(request, 'reservationapp/index3.html', {'e': e})

@csrf_exempt
def user_logout(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/index')
    else:
        return HttpResponseRedirect('/index')


