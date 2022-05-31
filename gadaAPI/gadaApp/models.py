
from distutils.command.upload import upload
from turtle import title
from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=100 , null=False , blank=False)
    description = models.TextField(null=False, blank=False)

    goal = models.IntegerField(null=False )

    donated = models.IntegerField(null=True, default=0)
    donator_count = models.IntegerField(null=True, default=0)
    created = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to = 'uploaded' , blank = True)
   
    def __str__(self):
        return self.title

class Doantion(models.Model):
    user = models.ManyToManyField(User)
    donated_amount = models.IntegerField(null = False)
    post =  models.ManyToOneRel(ForeignKey = Post)
    account_number = models.CharField(null=False)

    def __str__(self):
        return 

