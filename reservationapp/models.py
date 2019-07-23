from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class RUser(AbstractUser):
    pass


class Notice_place(models.Model):
    place = models.CharField(max_length=50, verbose_name='预约场地')
    people = models.CharField(max_length=50, verbose_name='预约人员')
    date = models.CharField(max_length=50, verbose_name='预约日期')
    time_begin = models.CharField(max_length=100, verbose_name='开始时间')
    time_end = models.CharField(max_length=100, verbose_name='结束时间')
    number = models.CharField(max_length=50, verbose_name='联系方式')
    remark = models.CharField(max_length=1000, verbose_name='其他备注')

    class Meta:
        verbose_name = '预约场地详情'
        verbose_name_plural = verbose_name

class Notice_instrument(models.Model):
    place = models.CharField(max_length=50, verbose_name='预约仪器')
    people = models.CharField(max_length=50, verbose_name='预约人员')
    date = models.CharField(max_length=50, verbose_name='预约日期')
    time_begin = models.CharField(max_length=100, verbose_name='开始时间')
    time_end = models.CharField(max_length=100, verbose_name='结束时间')
    number = models.CharField(max_length=50, verbose_name='联系方式')
    remark = models.CharField(max_length=1000, verbose_name='其他备注')

    class Meta:
        verbose_name = '预约仪器详情'
        verbose_name_plural = verbose_name


class Place(models.Model):
    place_name = models.CharField(max_length=100, verbose_name='预约场地')

    class Meta:
        verbose_name = '预约场地种类'
        verbose_name_plural = verbose_name


class Instrument(models.Model):
    instrument_name = models.CharField(max_length=100, verbose_name='预约仪器')

    class Meta:
        verbose_name = '预约仪器种类'
        verbose_name_plural = verbose_name