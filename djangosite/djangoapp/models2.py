# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Availability(models.Model):
    persid = models.IntegerField(primary_key=True)
    training = models.SmallIntegerField()
    subtraining = models.SmallIntegerField()
    events = models.SmallIntegerField()
    subevents = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'availability'


class Comments(models.Model):
    commentid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    type = models.CharField(max_length=16, blank=True, null=True)
    id = models.IntegerField()
    replytoid = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=64, blank=True, null=True)
    subject = models.CharField(max_length=256, blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comments'


class Contents(models.Model):
    contentid = models.AutoField(primary_key=True)
    teamid = models.IntegerField(blank=True, null=True)
    contentcat = models.IntegerField(blank=True, null=True)
    public = models.SmallIntegerField()
    menuno = models.IntegerField(blank=True, null=True)
    menutitle = models.CharField(max_length=128, blank=True, null=True)
    title = models.CharField(max_length=128, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    image = models.BinaryField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'contents'


class Diary(models.Model):
    diaryid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    eventid = models.IntegerField()
    persid = models.IntegerField()
    title = models.CharField(max_length=128, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    image = models.BinaryField(blank=True, null=True)
    gallerylink = models.IntegerField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'diary'


class Equalisations(models.Model):
    equalid = models.AutoField(primary_key=True)
    persid = models.IntegerField(blank=True, null=True)
    eventid = models.IntegerField(blank=True, null=True)
    teamid = models.IntegerField()
    payedtopersid = models.IntegerField(blank=True, null=True)
    equalamount = models.FloatField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'equalisations'


class Events(models.Model):
    eventid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    recurrenceid = models.IntegerField(blank=True, null=True)
    eventname = models.CharField(max_length=150)
    city = models.CharField(max_length=150, blank=True, null=True)
    datestart = models.DateTimeField(blank=True, null=True)
    dateend = models.DateTimeField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    eventurl = models.CharField(max_length=128, blank=True, null=True)
    nopers = models.IntegerField(blank=True, null=True)
    maxweight = models.FloatField(blank=True, null=True)
    invitationstatus = models.IntegerField()
    remindermail = models.SmallIntegerField()
    remindersms = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'events'


class Expences(models.Model):
    ecoid = models.AutoField(primary_key=True)
    persid = models.IntegerField(blank=True, null=True)
    eventid = models.IntegerField(blank=True, null=True)
    teamid = models.IntegerField()
    post = models.CharField(max_length=50, blank=True, null=True)
    expence = models.FloatField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'expences'


class Expencetopers(models.Model):
    ecoid = models.IntegerField(blank=True, null=True)
    persid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'expencetopers'
        unique_together = (('ecoid', 'persid'),)


class Faqs(models.Model):
    faqid = models.AutoField(primary_key=True)
    question = models.CharField(max_length=128, blank=True, null=True)
    answer = models.TextField(blank=True, null=True)
    views = models.IntegerField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'faqs'


class Gallery(models.Model):
    galleryid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    persid = models.IntegerField()
    title = models.CharField(max_length=128, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    private = models.SmallIntegerField(blank=True, null=True)
    open = models.SmallIntegerField()
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gallery'


class Helptable(models.Model):
    helpname = models.CharField(primary_key=True, max_length=64)
    helptext = models.TextField()

    class Meta:
        managed = False
        db_table = 'helptable'


class Links(models.Model):
    linkid = models.AutoField(primary_key=True)
    teamid = models.IntegerField(blank=True, null=True)
    category = models.CharField(max_length=64, blank=True, null=True)
    title = models.CharField(max_length=64, blank=True, null=True)
    url = models.CharField(max_length=128, blank=True, null=True)
    comment = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'links'


class Mainteam(models.Model):
    teamid = models.AutoField(primary_key=True)
    teamurlname = models.CharField(unique=True, max_length=64)
    teamname = models.CharField(max_length=128)
    sport = models.CharField(max_length=128, blank=True, null=True)
    nopers = models.IntegerField()
    maxweight = models.FloatField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)
    hits = models.IntegerField(blank=True, null=True)
    templateid = models.IntegerField(blank=True, null=True)
    color1 = models.CharField(max_length=7, blank=True, null=True)
    color2 = models.CharField(max_length=7, blank=True, null=True)
    color3 = models.CharField(max_length=7, blank=True, null=True)
    color4 = models.CharField(max_length=7, blank=True, null=True)
    color5 = models.CharField(max_length=7, blank=True, null=True)
    color6 = models.CharField(max_length=7, blank=True, null=True)
    color7 = models.CharField(max_length=7)
    color8 = models.CharField(max_length=7)
    topimg = models.BinaryField(blank=True, null=True)
    smsreminder = models.SmallIntegerField()
    mailreminder = models.SmallIntegerField()
    statereminder = models.SmallIntegerField()
    sendsmsok = models.SmallIntegerField()
    maximagesize = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'mainteam'


class Nosms(models.Model):
    teamid = models.IntegerField()
    nosms = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nosms'


class Perscategory(models.Model):
    teamid = models.IntegerField(blank=True, null=True)
    category = models.IntegerField(blank=True, null=True)
    catname = models.CharField(max_length=32, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'perscategory'
        unique_together = (('teamid', 'category'),)


class Pics(models.Model):
    picid = models.AutoField(primary_key=True)
    galleryid = models.IntegerField(blank=True, null=True)
    teamid = models.IntegerField()
    persid = models.IntegerField()
    title = models.CharField(max_length=128, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    filetype = models.CharField(max_length=16)
    youtubelink = models.CharField(max_length=512)
    imgdata = models.BinaryField(blank=True, null=True)
    thumbdata = models.BinaryField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pics'


class Positions(models.Model):
    persid = models.IntegerField(primary_key=True)
    skipper = models.SmallIntegerField()
    tactic = models.SmallIntegerField()
    main = models.SmallIntegerField()
    genoa = models.SmallIntegerField()
    tailor = models.SmallIntegerField()
    grinder = models.SmallIntegerField()
    pit = models.SmallIntegerField()
    deck = models.SmallIntegerField()
    mast = models.SmallIntegerField()
    other = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'positions'


class Posneg(models.Model):
    eventid = models.IntegerField()
    persid = models.IntegerField()
    state = models.SmallIntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'posneg'
        unique_together = (('eventid', 'persid'),)


class Racediary(models.Model):
    racediaryid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    eventid = models.IntegerField()
    persid = models.IntegerField()
    title = models.CharField(max_length=256, blank=True, null=True)
    conditions = models.TextField(blank=True, null=True)
    positiveboathandling = models.TextField(blank=True, null=True)
    positivetactics = models.TextField(blank=True, null=True)
    positiveother = models.TextField(blank=True, null=True)
    negativeboathandling = models.TextField(blank=True, null=True)
    negativetactics = models.TextField(blank=True, null=True)
    negativeother = models.TextField(blank=True, null=True)
    learned = models.TextField(blank=True, null=True)
    trainingfocus = models.TextField(blank=True, null=True)
    other = models.TextField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'racediary'


class Reminderlog(models.Model):
    persid = models.IntegerField(blank=True, null=True)
    eventid = models.IntegerField(blank=True, null=True)
    statereminder = models.SmallIntegerField(blank=True, null=True)
    statesenddate = models.DateTimeField()
    mailreminder = models.SmallIntegerField(blank=True, null=True)
    mailsenddate = models.DateTimeField()
    smsreminder = models.SmallIntegerField(blank=True, null=True)
    smssenddate = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'reminderlog'
        unique_together = (('persid', 'eventid'),)


class Sponsor(models.Model):
    sponsorid = models.AutoField(primary_key=True)
    teamid = models.IntegerField()
    title = models.CharField(max_length=128, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    image = models.BinaryField(blank=True, null=True)
    url = models.CharField(max_length=256, blank=True, null=True)
    orderno = models.IntegerField(blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sponsor'


class Stat(models.Model):
    statid = models.AutoField(primary_key=True)
    teamid = models.IntegerField(blank=True, null=True)
    visittime = models.DateTimeField()
    firstvisit = models.SmallIntegerField()
    useragent = models.CharField(max_length=128, blank=True, null=True)
    referer = models.CharField(max_length=64, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'stat'


class Team(models.Model):
    persid = models.AutoField(primary_key=True)
    admin = models.SmallIntegerField(blank=True, null=True)
    admineditok = models.SmallIntegerField(blank=True, null=True)
    category = models.IntegerField(blank=True, null=True)
    active = models.SmallIntegerField(blank=True, null=True)
    passwd = models.CharField(max_length=150, blank=True, null=True)
    name = models.CharField(max_length=150)
    mobile = models.IntegerField(blank=True, null=True)
    tele = models.IntegerField(blank=True, null=True)
    worktele = models.IntegerField(blank=True, null=True)
    street = models.CharField(max_length=150, blank=True, null=True)
    postcode = models.IntegerField(blank=True, null=True)
    city = models.CharField(max_length=150, blank=True, null=True)
    email = models.CharField(unique=True, max_length=150, blank=True, null=True)
    publicinfo = models.SmallIntegerField()
    comment = models.TextField(blank=True, null=True)
    imgdata = models.BinaryField(blank=True, null=True)
    thumbdata = models.BinaryField(blank=True, null=True)
    position = models.CharField(max_length=128)
    description = models.TextField()
    birthday = models.IntegerField()
    club = models.CharField(max_length=128)
    proffesion = models.CharField(max_length=128)
    history = models.TextField()
    account = models.CharField(max_length=32)
    created = models.DateTimeField()
    sex = models.CharField(max_length=8)
    level = models.IntegerField()
    weight = models.FloatField()
    lastlogin = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'team'


class Teamtomember(models.Model):
    teamid = models.IntegerField()
    persid = models.IntegerField()
    category = models.IntegerField()
    active = models.SmallIntegerField()
    admin = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'teamtomember'
        unique_together = (('teamid', 'persid'),)
