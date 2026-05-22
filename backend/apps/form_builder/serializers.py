from rest_framework import serializers
from .models import Form, Section, Field, FieldChoice


class FieldChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = FieldChoice
        fields = ['id', 'choice_text']


class FieldSerializer(serializers.ModelSerializer):
    choices = FieldChoiceSerializer(many=True)

    class Meta:
        model = Field
        fields = ['id', 'label', 'field_type', 'choices']


class SectionSerializer(serializers.ModelSerializer):
    form_fields = FieldSerializer(many=True)

    class Meta:
        model = Section
        fields = ['id', 'name', 'form_fields']


class FormSerializer(serializers.ModelSerializer):
    sections = SectionSerializer(many=True)

    class Meta:
        model = Form
        fields = ['id', 'name', 'sections']
    
    def create(self, validated_data):

        print(" validated_data", validated_data)
        print(" validated_data keys", validated_data.keys())
        print(" validated_data values", validated_data.values())

        # :extracting sections and fields from validated_data
        sections_data = validated_data.pop('sections', [])
        # :creating and saving form instance
        form = Form.objects.create(**validated_data)
        # :looping through sections and creating them
        for section_data in sections_data:
            # extracting fields from section data
            fields_data = section_data.pop('form_fields', [])
            # creating and saving section instance
            section = Section.objects.create(form=form, **section_data)

            print(" section", section)

            # looping through fields and creating them
            for field_data in fields_data:
                # extracting choices from each field data
                choices_data = field_data.pop('choices', [])
                # creating and saving field instance
                field = Field.objects.create(section=section, **field_data)

                print(" field", field)

                # looping through choices and creating them
                for choice_data in choices_data:
                    FieldChoice.objects.create(field=field, **choice_data)
        return form
