
from distutils.command.upload import upload
from turtle import title
from django.db import models

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
