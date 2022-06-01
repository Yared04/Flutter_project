
import email
from rest_framework import serializers
from django.contrib.auth.models import User

from gadaApp.models import Post

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['title' , 'description' , 'goal' , 'image' ]

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['first_name' , 'last_name' , 'email' , 'is_staff' , 'is_superuser']