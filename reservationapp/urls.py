from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index, name='index'),
    path('index_wx/', views.index_wx, name='index_wx'),
    path('index1/', views.index1, name='index1'),
    path('index1_wx/', views.index1_wx, name='index1_wx'),
    path('index2/', views.index2, name='index2'),
    path('index2_wx/', views.index2_wx, name='index2_wx'),
    path('index3/', views.index3, name='index3'),
    path('index3_wx/', views.index3_wx, name='index3_wx'),
    path('index4/', views.index4, name='index4'),
    path('index4_wx/', views.index4_wx, name='index4_wx'),
    path('user_logout/', views.user_logout, name='user_logout'),
    path('user_logout_wx/', views.user_logout_wx, name='user_logout_wx'),
    path('MnhGYLEUPd.txt/', views.txt, name='MnhGYLEUPd.txt'),
]
