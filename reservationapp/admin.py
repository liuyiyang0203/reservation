from django.contrib import admin
from .models import Notice,Place,Instrument
# Register your models here.


class NoticeAdmin(admin.ModelAdmin):
    list_display = ('place', 'people', 'date', 'time', 'number', 'remark')
    list_filter = ('date',)
    search_fields = ('place','people','date','time','number','remark')
    # readonly_fields = ('place','people','date','time','number','remark')


admin.site.register(Notice, NoticeAdmin)


class PlaceAdmin(admin.ModelAdmin):
    list_display = ('place_name',)
    list_filter = ('place_name',)
    search_fields = ('place_name',)


admin.site.register(Place, PlaceAdmin)


class InstrumentAdmin(admin.ModelAdmin):
    list_display = ('instrument_name',)
    list_filter = ('instrument_name',)
    search_fields = ('instrument_name',)


admin.site.register(Instrument, InstrumentAdmin)