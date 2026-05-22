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

def update(self, instance, validated_data):
    sections_data = validated_data.pop('sections', [])

    # :get existing sections and fields from validated_data
    existing_sections = instance.sections.all()
    existing_section = list(existing_sections)
    # existing_section_ids = [section.id for section in existing_sections]

    # :save form instance
    instance.name = validated_data.get('name', instance.name)
    instance.save()

    # :looping through sections data and updating them
    for section_data in sections_data:

        if section_id := section_data.get('id'):
            # :Updating existing section
            section = existing_section.pop(0)
            section.name = section_data.get('name', section.name)
            section.save()
        else:
            # :creating new section
            section = Section.objects.create(
                name=section_data.get('name'), 
                form=instance)

        # :getting the form fields 
        fields_data = section_data.pop("form_fields", [])

        # :getting the existing fields
        existing_fields = section.fields.all()
        existing_fields = list(existing_fields)

        # :looping through fields data
        for field_data in fields_data:
            if field_id := field_data.get("id", None):
                # :field exists, update it
                field = existing_fields.pop(0)
                field.label = field_data.get('label', field.label)
                field.field_type = field_data.get('field_type', field.field_type)
                field.save()
            else:
                # :field does not exist, create it
                Field.objects.create(
                    label=field_data.get('label'),
                    field_type=field_data.get('field_type'),
                    section=section)

            # :get the choices data
            choices_data = field_data.get('choices', [])

            # :existing choices
            existing_choices = field.choices.all()
            existing_choices = list(existing_choices)

            # :looping through choices data
            for choice_data in choices_data:
                if choice_id := choice_data.get("id", None):
                    # :choice exists, update it
                    choice = existing_choices.pop(0)
                    choice.choice_text = choice_data.get(
                        'choice_text', choice.choice_text)
                    choice.save()
                else:
                    # :choice does not exist, create it
                    choice =FieldChoice.objects.create(
                        choice_text=choice_data.get('choice_text'),
                        field=field)

            # :delete remaining choices
            for choice in existing_choices:
                choice.delete()
        # :delete remaining fields
        for field in existing_fields:
            field.delete()
    # :delete remaining sections
    for section in existing_section:
        section.delete()


    return instance
