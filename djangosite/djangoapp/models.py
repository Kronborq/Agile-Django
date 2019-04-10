# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = false` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Teammember(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    description = models.CharField(max_length=200, default='', null=True)
    address = models.CharField(max_length=40, null=True)
    age = models.IntegerField(null=True)

    class Meta:
        managed = True
        db_table = 'teammember'

    def __str__(self):
        if self.user is not None:
            return self.user.username
        else:
            return 'Teammember.object'

def create_profile(sender, **kwargs):
    if kwargs['created']:
        user_profile = Teammember.objects.create(user=kwargs['instance'])

post_save.connect(create_profile, sender=User)

class Mainteam(models.Model):
    teamid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, default='')
    description = models.CharField(max_length=600, default='')
    members = models.ManyToManyField(Teammember, through='Membership')

    def __str__(self):
            return self.name

    class Meta:
        managed = True
        db_table = 'mainteam'

class Membership(models.Model):
    member = models.ForeignKey(Teammember, on_delete=models.CASCADE)
    team = models.ForeignKey(Mainteam, on_delete=models.CASCADE)

    def __str__(self):
            return "Membership between " + str(self.member) + " and " + str(self.team)

    class Meta:
        managed = True
        db_table = 'membership'
        unique_together = (('member', 'team'),)


class Diary(models.Model):
    title = models.CharField(max_length=40)
    post = models.TextField()
    created = models.DateTimeField(blank=True, null=True)
    user = models.ForeignKey(Teammember, on_delete=models.CASCADE)

    def __str__(self):
            return self.title

    class Meta:
        managed = True
        db_table = 'Diary'
