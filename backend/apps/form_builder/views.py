from django.shortcuts import render
from rest_framework import generics
from .models import Form
from .serializers import FormSerializer

# Create your views here.
class FormList(generics.ListCreateAPIView):
    queryset = Form.objects.all()
    serializer_class = FormSerializer

class FormDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Form.objects.all()
    serializer_class = FormSerializer

