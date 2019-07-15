from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class RUser(AbstractUser):
    pass

class Notice(models.Model):
    place = models.CharField(max_length=50, verbose_name='预约场地、仪器')
    people = models.CharField(max_length=50, verbose_name='预约人员')
    date = models.CharField(max_length=50, verbose_name='预约日期')
    time = models.CharField(max_length=100, verbose_name='预约时间')
    number = models.CharField(max_length=50, verbose_name='联系方式')
    remark = models.CharField(max_length=1000, verbose_name='其他备注')

    class Meta:
        verbose_name = '预约详情'
        verbose_name_plural = verbose_name


class Place(models.Model):
    place_name = models.CharField(max_length=100, verbose_name='预约场地')

    class Meta:
        verbose_name = '预约场地信息更改'
        verbose_name_plural = verbose_name


class Instrument(models.Model):
    instrument_name = models.CharField(max_length=100, verbose_name='预约仪器')

    class Meta:
        verbose_name = '预约仪器信息更改'
        verbose_name_plural = verbose_name