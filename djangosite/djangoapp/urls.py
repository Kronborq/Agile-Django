from django.urls import path
from django.conf.urls import url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('about', views.about, name='about'),
    path('gallery', views.gallery, name='gallery'),
    path('contact', views.contact, name='contact'),
    path('register', views.register, name='register'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('team', views.TeamView.as_view(), name='team'),
    path('team/<int:teamid>/', views.ChosenTeamView, name='chosen_team'),
    path('edit_profile', views.EditProfileView.as_view(), name='edit_profile'),
    path('profile', views.ProfileView.as_view(), name='profile'),

]
