
from rest_framework import serializers

from gadaApp.models import Post

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['title' , 'description' , 'goal' , 'image' ]