from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from . models import Teammember, Mainteam, Diary

class RegistrationForm(UserCreationForm):
    #email = models.EmailField(required=True)

    class Meta:
        model = User
        fields = (
        'username',
        'first_name',
        'last_name',
        'email',
        'password1',
        'password2',
        )

    def save(self, commit=True):
        user = super(RegistrationForm, self).save(commit=False)
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']

        if commit:
            user.save()

        return user


class ProfileForm(forms.ModelForm):
    description = forms.CharField(required=False)
    address = forms.CharField(required=False)
    age = forms.IntegerField(required=False)

    class Meta:
        model = Teammember
        fields = ('description','address', 'age', )


class TeamForm(forms.Form):
    name = forms.CharField()
    description = forms.CharField()

    class Meta:
        model = Mainteam
        fields = ('name', 'description',)

class ChosenTeamForm(forms.ModelForm):
    title = forms.CharField(required=True)
    post = forms.CharField(widget=forms.Textarea)

    class Meta:
        model = Diary
        fields = ('title', 'post',)
