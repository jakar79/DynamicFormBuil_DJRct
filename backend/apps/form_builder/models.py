from django.db import models

# Create your models here.
class Form(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.name

class Section(models.Model):
    form = models.ForeignKey(Form, on_delete=models.CASCADE, related_name='sections')
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.name

class Field(models.Model):
    FIELD_TYPES_CHOICES = [
        ('text', 'Text'),
        ('number', 'Number'),
        ('email', 'Email'),
        ('phone', 'Phone'),
        ('checkbox', 'Checkbox'),
        ('radio', 'Radio'),
        ('select', 'Select'),
    ]

    label = models.CharField(max_length=255)
    field_type = models.CharField(max_length=255, choices=FIELD_TYPES_CHOICES)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, related_name='form_fields')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.label

class FieldChoice(models.Model):
    field = models.ForeignKey(Field, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=255)
    choice_value = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.choice_text
