from django.contrib import admin
from .models import Notice_place,Notice_instrument,Place,Instrument
from django.contrib.auth.models import Group
# Register your models here.


class Notice_place_Admin(admin.ModelAdmin):
    list_display = ('place', 'people', 'date', 'time_begin', 'time_end', 'number', 'remark')
    list_filter = ('date',)
    search_fields = ('place','people','date', 'time_begin', 'time_end', 'number','remark')
    # readonly_fields = ('place','people','date','time','number','remark')


admin.site.register(Notice_place, Notice_place_Admin)


class Notice_instrument_Admin(admin.ModelAdmin):
    list_display = ('place', 'people', 'date', 'time_begin', 'time_end', 'number', 'remark')
    list_filter = ('date',)
    search_fields = ('place','people','date', 'time_begin', 'time_end', 'number','remark')
    # readonly_fields = ('place','people','date','time','number','remark')


admin.site.register(Notice_instrument, Notice_instrument_Admin)



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
admin.site.unregister(Group)
