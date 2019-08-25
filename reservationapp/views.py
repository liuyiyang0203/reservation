from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth import logout
from django.contrib.auth import login as auth_login
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from .models import Notice_place,Notice_instrument,RUser,Place,Instrument
from django.core.paginator import Paginator
import datetime
import time

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


def index_wx(request):
    error_msg = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        print(username)
        print(password)
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return HttpResponseRedirect('/index3_wx')
        else:
            error_msg = '用户名密码错误'
            return render(request, 'reservationapp/index_wx.html',{'error_msg': error_msg})
    return render(request, 'reservationapp/index_wx.html')


@login_required
def index1(request):
    place_name = Place.objects.all()
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time_begin = request.POST.get('time_begin', None)
        time_end = request.POST.get('time_end', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约场地'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time_begin == '' or time_end == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        elif int(time_end) <= int(time_begin):
            error_msg = '结束时间应当大于开始时间'
        else:
            a = Notice_place.objects.filter(place=place, date=date)
            if a.count() == 0:
                b = Notice_place(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end,number=number, remark=remark)
                b.save()
                error_msg = '预约成功'
                return render(request, 'reservationapp/index1.html', {'error_msg': error_msg, 'place_name': place_name})
            for i in range(len(a)):
                if (int(a[i].time_begin)<=int(time_begin)<int(a[i].time_end)) or (int(a[i].time_begin)<int(time_end)<=int(a[i].time_end)) or (int(a[i].time_begin)<=int(time_begin) and int(a[i].time_end)>=int(time_end)) or (int(a[i].time_begin)>=int(time_begin) and int(a[i].time_end)<=int(time_end)):
                    error_msg = '预约失败，该场地在此时段已经被预约'
                    return render(request, 'reservationapp/index1.html',{'error_msg': error_msg, 'place_name': place_name})
            b = Notice_place(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end, number=number, remark=remark)
            b.save()
            error_msg = '预约成功'
            return render(request, 'reservationapp/index1.html', {'error_msg': error_msg, 'place_name': place_name})
        return render(request, 'reservationapp/index1.html', {'error_msg': error_msg, 'place_name': place_name})
    return render(request, 'reservationapp/index1.html', {'place_name': place_name})


@login_required
def index1_wx(request):
    place_name = Place.objects.all()
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time_begin = request.POST.get('time_begin', None)
        time_end = request.POST.get('time_end', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约场地'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time_begin == '' or time_end == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        elif int(time_end) <= int(time_begin):
            error_msg = '结束时间应当大于开始时间'
        else:
            a = Notice_place.objects.filter(place=place, date=date)
            if a.count() == 0:
                b = Notice_place(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end, number=number, remark=remark)
                b.save()
                error_msg = '预约成功'
                return render(request, 'reservationapp/index1_wx.html', {'error_msg': error_msg, 'place_name': place_name})
            for i in range(len(a)):
                if (int(a[i].time_begin) <= int(time_begin) < int(a[i].time_end)) or (int(a[i].time_begin) < int(time_end) <= int(a[i].time_end)) or (int(a[i].time_begin) <= int(time_begin) and int(a[i].time_end) >= int(time_end)) or (int(a[i].time_begin) >= int(time_begin) and int(a[i].time_end) <= int(time_end)):
                    error_msg = '预约失败，该场地在此时段已经被预约'
                    return render(request, 'reservationapp/index1_wx.html',{'error_msg': error_msg, 'place_name': place_name})
            b = Notice_place(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end,number=number, remark=remark)
            b.save()
            error_msg = '预约成功'
            return render(request, 'reservationapp/index1_wx.html', {'error_msg': error_msg, 'place_name': place_name})
        return render(request, 'reservationapp/index1_wx.html', {'error_msg': error_msg, 'place_name': place_name})
    return render(request, 'reservationapp/index1_wx.html', {'place_name': place_name})


@login_required
def index2(request):
    instrument_name = Instrument.objects.all()
    print(instrument_name)
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time_begin = request.POST.get('time_begin', None)
        time_end = request.POST.get('time_end', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约仪器'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time_begin == '' or time_end == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        elif int(time_end) <= int(time_begin):
            error_msg = '结束时间应当大于开始时间'
        else:
            a = Notice_instrument.objects.filter(place=place, date=date)
            if a.count() == 0:
                b = Notice_instrument(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end,number=number, remark=remark)
                b.save()
                error_msg = '预约成功'
                return render(request, 'reservationapp/index2.html', {'error_msg': error_msg, 'instrument_name': instrument_name})
            for i in range(len(a)):
                if (int(a[i].time_begin) <= int(time_begin) < int(a[i].time_end)) or (int(a[i].time_begin) < int(time_end) <= int(a[i].time_end)) or (int(a[i].time_begin) <= int(time_begin) and int(a[i].time_end) >= int(time_end)) or (int(a[i].time_begin) >= int(time_begin) and int(a[i].time_end) <= int(time_end)):
                    error_msg = '预约失败，该仪器在此时段已经被预约'
                    return render(request, 'reservationapp/index2.html',{'error_msg': error_msg, 'instrument_name': instrument_name})
            b = Notice_instrument(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end, number=number, remark=remark)
            b.save()
            error_msg = '预约成功'
            return render(request, 'reservationapp/index2.html', {'error_msg': error_msg, 'instrument_name': instrument_name})
        return render(request, 'reservationapp/index2.html', {'error_msg': error_msg, 'instrument_name': instrument_name})
    return render(request, 'reservationapp/index2.html', {'instrument_name': instrument_name})


@login_required
def index2_wx(request):
    instrument_name = Instrument.objects.all()
    error_msg = ''
    if request.method == 'POST':
        place = request.POST.get('place', None)
        people = request.POST.get('people', None)
        date = request.POST.get('date', None)
        time_begin = request.POST.get('time_begin', None)
        time_end = request.POST.get('time_end', None)
        number = request.POST.get('number', None)
        remark = request.POST.get('remark', None)
        if place == '':
            error_msg = '请正确填写预约仪器'
        elif people == '':
            error_msg = '请正确填写预约人员'
        elif date == '' or time_begin == '' or time_end == '':
            error_msg = '请正确填写预约时间'
        elif number == '':
            error_msg = '请正确填写联系方式'
        elif int(time_end) <= int(time_begin):
            error_msg = '结束时间应当大于开始时间'
        else:
            a = Notice_instrument.objects.filter(place=place, date=date)
            if a.count() == 0:
                b = Notice_instrument(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end,number=number, remark=remark)
                b.save()
                error_msg = '预约成功'
                return render(request, 'reservationapp/index2_wx.html',{'error_msg': error_msg, 'instrument_name': instrument_name})
            for i in range(len(a)):
                if (int(a[i].time_begin) <= int(time_begin) < int(a[i].time_end)) or (int(a[i].time_begin) < int(time_end) <= int(a[i].time_end)) or (int(a[i].time_begin) <= int(time_begin) and int(a[i].time_end) >= int(time_end)) or (int(a[i].time_begin) >= int(time_begin) and int(a[i].time_end) <= int(time_end)):
                    error_msg = '预约失败，该仪器在此时段已经被预约'
                    return render(request, 'reservationapp/index2_wx.html',{'error_msg': error_msg, 'instrument_name': instrument_name})
            b = Notice_instrument(place=place, people=people, date=date, time_begin=time_begin, time_end=time_end,
                                  number=number, remark=remark)
            b.save()
            error_msg = '预约成功'
            return render(request, 'reservationapp/index2_wx.html',{'error_msg': error_msg, 'instrument_name': instrument_name})
        return render(request, 'reservationapp/index2_wx.html',{'error_msg': error_msg, 'instrument_name': instrument_name})
    return render(request, 'reservationapp/index2_wx.html', {'instrument_name': instrument_name})


@login_required
def index3(request):
    e = []
    b = Notice_place.objects.all().order_by('-date', 'time_begin', 'time_end')
    now = datetime.datetime.now().date().strftime('%Y-%m-%d')
    now = time.mktime(time.strptime(now, "%Y-%m-%d"))
    for i in range(len(b)):
        enow = time.mktime(time.strptime(b[i].date, "%Y-%m-%d"))
        if (int(enow) - int(now)) >= 0:
            e.append(b[i])
    paginator = Paginator(e, 10)
    page = request.GET.get('page')
    try:  # 获取某页
        e = paginator.page(page)
    except :  # 如果 page 参数不为正整数，显示第一页
        e = paginator.page(1)
    return render(request, 'reservationapp/index3.html', {'e':e})


@login_required
def index3_wx(request):
    e = []
    b = Notice_place.objects.all().order_by('-date', 'time_begin', 'time_end')
    now = datetime.datetime.now().date().strftime('%Y-%m-%d')
    now = time.mktime(time.strptime(now, "%Y-%m-%d"))
    for i in range(len(b)):
        enow = time.mktime(time.strptime(b[i].date, "%Y-%m-%d"))
        if (int(enow) - int(now)) >= 0:
            e.append(b[i])
    paginator = Paginator(e, 10)
    page = request.GET.get('page')
    try:  # 获取某页
        e = paginator.page(page)
    except:  # 如果 page 参数不为正整数，显示第一页
        e = paginator.page(1)
    return render(request, 'reservationapp/index3_wx.html', {'e': e})


@login_required
def index4(request):
    e = []
    b = Notice_instrument.objects.all().order_by('-date', 'time_begin', 'time_end')
    now = datetime.datetime.now().date().strftime('%Y-%m-%d')
    now = time.mktime(time.strptime(now, "%Y-%m-%d"))
    for i in range(len(b)):
        enow = time.mktime(time.strptime(b[i].date, "%Y-%m-%d"))
        if (int(enow) - int(now)) >= 0:
            e.append(b[i])
    paginator = Paginator(e, 10)
    page = request.GET.get('page')
    try:  # 获取某页
        e = paginator.page(page)
    except:  # 如果 page 参数不为正整数，显示第一页
        e = paginator.page(1)
    return render(request, 'reservationapp/index4.html', {'e': e})


@login_required
def index4_wx(request):
    e = []
    b = Notice_instrument.objects.all().order_by('-date', 'time_begin', 'time_end')
    now = datetime.datetime.now().date().strftime('%Y-%m-%d')
    now = time.mktime(time.strptime(now, "%Y-%m-%d"))
    for i in range(len(b)):
        enow = time.mktime(time.strptime(b[i].date, "%Y-%m-%d"))
        if (int(enow) - int(now)) >= 0:
            e.append(b[i])
    paginator = Paginator(e, 10)
    page = request.GET.get('page')
    try:  # 获取某页
        e = paginator.page(page)
    except:  # 如果 page 参数不为正整数，显示第一页
        e = paginator.page(1)
    return render(request, 'reservationapp/index4_wx.html', {'e': e})


@csrf_exempt
def user_logout(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/index')
    else:
        return HttpResponseRedirect('/index')


@csrf_exempt
def user_logout_wx(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/index_wx')
    else:
        return HttpResponseRedirect('/index_wx')


def txt(request):
    f = '6ed8edd99c82423bca108f7bc06cf71b'
    return HttpResponse(f)