from rest_framework import serializers
from .models import Form, Section, Field, FieldChoice

class FormSerializer(serializers.ModelSerializer):
    class Meta:
        model = Form
        fields = '__all__'

class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields = '__all__'

class FieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = Field
        fields = '__all__'

class FieldChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = FieldChoice
        fields = '__all__'
