from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from djangoapp.models import Teammember, Mainteam, Diary
from djangoapp.forms import ProfileForm, RegistrationForm, TeamForm, ChosenTeamForm
from django.views.generic import TemplateView
from django.urls import reverse

# Create your views here.
def index(request):
    return render(request, 'index.html')

def about(request):
    return render(request, 'about.html')

def gallery(request):
    return render(request, 'gallery.html')

def contact(request):
    return render(request, 'contact.html')

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = RegistrationForm()
        args = {'form': form}
        return render(request, 'registration/register.html', args)

def login(request):
    return render(request, 'login.html')

def logout(request):
    return render(request, 'logout.html')

class ProfileView(TemplateView):
    template_name = 'profile.html'

    def get(self, request):
        form = ProfileForm()
        args = {'form': form}
        return render(request, self.template_name, args)

    def post(self, request):
        form = ProfileForm(request.POST, instance=request.user.teammember)
        if form.is_valid():
            form.save()

            text = form.cleaned_data['description']
            return redirect('profile')

        else:
            args = {'form': form, 'text': text}
        return render(request, self.template_name, args)

class EditProfileView(TemplateView):
    template_name = 'edit_profile.html'

    def get(self, request):
        form = ProfileForm(instance=request.user.teammember)
        args = {'form': form}
        return render(request, self.template_name, args)

    def post(self, request):
        form = ProfileForm(request.POST, instance=request.user.teammember)
        if form.is_valid():
            text = form.cleaned_data['description']
            form.save()

            return redirect('profile')

        else:
            args = {'form': form, 'text': text}
        return render(request, self.template_name, args)


class TeamView(TemplateView):
    template_name = 'team.html'


    def get(self, request):
        current_user = request.user.teammember
        current_teams = Mainteam.objects.filter(members = current_user)
        form = TeamForm()
        args = {'form': form, 'current_user': current_user, 'current_teams': current_teams}
        return render(request, self.template_name, args)

    def post(self, request):
        form = TeamForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('team')
        args = {'form': form, 'text': text}
        return render(request, self.template_name, args)
'''
class ChosenTeamView(TemplateView):
    template_name = 'chosen_team.html'

    def get(self, request, teamid):
        posts = Diary.objects.all().order_by('created')
        form = ChosenTeamForm()
        args = {'form': form, 'posts': posts}
        return render(request, self.template_name, args)

    def post(self, request, teamid):
        form = ChosenTeamForm(request.POST, instance=request.user.teammember)
        if form.is_valid():
            form.save()
            return redirect('team')
        args = {'form': form, 'text': text}
        return render(request, self.template_name, args)
'''
def ChosenTeamView(request, teamid):
    if request.method == 'POST':
        form = ChosenTeamForm(request.POST, instance=request.user.teammember)
        if form.is_valid():
            form.save()
            return redirect('team')
        args = {'form': form, 'text': text}
        return render(request, 'chosen_team.html', args)
    else:
        posts = Diary.objects.all().order_by('created')
        form = ChosenTeamForm()
        args = {'form': form, 'posts': posts}
        return render(request, 'chosen_team.html', args)
