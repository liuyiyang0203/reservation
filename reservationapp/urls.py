from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index),
    path('index/index1', views.index1),
    path('index/index2', views.index2),
]
