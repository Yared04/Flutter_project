
from distutils.command.upload import upload
from turtle import title
from django.db import models
from django.contrib.auth.models import User


# Create your models here.
# fields = ['title' , 'description' , 'goal' , 'image' ] required
class Post(models.Model):
    title = models.CharField(max_length=100 , null=False , blank=False)
    description = models.TextField(null=False, blank=False)

    goal = models.IntegerField(null=False )

    donated = models.IntegerField(null=True, blank=True, default=0)
    donator_count = models.IntegerField(null=True, blank= True, default=0)
    created = models.DateTimeField(null= True , blank= True)
    image = models.ImageField(upload_to = 'uploaded')
   
    def __str__(self):
        return self.title

class Donation(models.Model):
    user = models.ManyToManyField(User)
    donated_amount = models.IntegerField(null = False)
    post =  models.ManyToOneRel(field= Post.id , to=Post , field_name= "post")
    account_number = models.CharField(null=False , max_length=20)

    def __str__(self):
        return 

