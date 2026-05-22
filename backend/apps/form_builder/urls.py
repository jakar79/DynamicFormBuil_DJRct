from django.urls import path
from .views import FormList, FormDetail

urlpatterns = [
    path('forms/', FormList.as_view(), name='form-list'),
    path('forms/<int:pk>/', FormDetail.as_view(), name='form-detail'),
]