
import email
from rest_framework import serializers
from django.contrib.auth.models import User

from gadaApp.models import Post,Member

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        # fields = ['title' , 'description' , 'goal' , 'image' ]
        fields = '__all__'

class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = 'all'