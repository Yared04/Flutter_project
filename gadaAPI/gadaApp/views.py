
from email.mime import image
from django.shortcuts import render
from django.http import HttpResponse , JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt
import json
from gadaApp.serializers import PostSerializer
from .models import Post

# Create your views here.
@csrf_exempt
def posts(request):
    if request.method == 'GET':
        serializer = PostSerializer(Post.objects.all() , many = True) 
        return JsonResponse(serializer.data, safe=False)
    
    if request.method == 'POST':
    
        serializer = PostSerializer(data=request.POST)
        serializer.is_valid()
        print(request.FILES)
        serializer.data['image'] = request.FILES['image']
        
        print(serializer,'sjj')
        if serializer.is_valid():
            print(serializer.data)
            # serializer.save()
            return JsonResponse(serializer.data , status= 201)
        return JsonResponse(serializer.data,status = 400)

@csrf_exempt
def post_detail(request , pk):
    if request.method == 'GET':
        try:
            post = Post.objects.get(id = pk)
        except:
            return HttpResponse(status = 404)

        serialized = PostSerializer(post)
        return(JsonResponse(serialized.data))

        pass
   
    elif request.method == 'PUT':
        pass
    elif request.method == 'DELETE':
        pass
