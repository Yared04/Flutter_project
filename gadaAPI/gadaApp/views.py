from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse , JsonResponse
from requests import delete
from rest_framework.parsers import JSONParser , MultiPartParser , FormParser
from django.views.decorators.csrf import csrf_exempt
import json
from rest_framework.views import APIView
from .serializers import UserSerializer
from gadaApp.serializers import PostSerializer
from .models import Post,Donation
from django.contrib.auth.models import User


class PostViewCreate(APIView):
    serializer_class = PostSerializer
    parser_classes = [MultiPartParser, FormParser]
    def get(self, request):
        posts = Post.objects.all()
        serializer = self.serializer_class(instance=posts , many = True)
        return JsonResponse(serializer.data , status = 200 , safe=False)
       
    def post(self, request, format=None):
        data = request.data
        serialized = PostSerializer(data=data)
        if serialized.is_valid():
            serialized.save()
            
            return JsonResponse(serialized.data, status=201)
        
        return JsonResponse(serialized.errors, status=400)
    
class DetailPost(APIView):
    serializer_class = PostSerializer
    parser_classes = [MultiPartParser, FormParser]
    def get(self , request , pk):
        try:
            post = Post.objects.get(pk = pk)
        except:

            return HttpResponse(status = 404)

        serializer = self.serializer_class(instance= post)

        return JsonResponse(serializer.data , status = 200)

    def put(self , request , pk):
        data = request.data
        try:
            post = Post.objects.get(pk = pk)
        except:
            return HttpResponse(status = 400)

        serialized = PostSerializer(instance = post , data=data)
        if serialized.is_valid():
            serialized.save()
            
            return JsonResponse(serialized.data, status=201)
        
        return JsonResponse(serialized.errors, status=400)
        

    def delete(self , request , pk):
        try:
            post = Post.objects.get(pk = pk)
        except:
            return HttpResponse(status = 204)
        post.delete()
        return HttpResponse(status = 200)
        
class ViewUser(APIView):
    serializer_class = UserSerializer

    parser_classes = [JSONParser]

    def get(self , request):
        users = User.objects.all()

        serializer = self.serializer_class(instance=users, many = True)
        return JsonResponse(serializer.data , status = 200 , safe=False)

class DeleteUser(APIView):
    def delete(self , request , pk):
        try:
            user = User.objects.get(pk = pk)
        except:
            return HttpResponse(status = 204)
        user.delete()
        return HttpResponse(status = 200)
    

class DonationCreate(APIView):

    def get(self, request):
        donations = Donation.objects.all()
        serializer = PostSerializer(instance = donations, many = True)
        return JsonResponse(serializer.data, status = 200, safe=False)

    def post(self,request):
        data = request.data
        serialized = PostSerializer(data=data)
        if serialized.is_valid:
            serialized.save()
            return JsonResponse(serialized.data, status= 201)
        return JsonResponse(serialized.errors, status=400)

class DonationDetail(APIView):
    def get(self,request, pk):
        donation = Donation.objects.get(id = pk)
        serializer = PostSerializer(donation)
        return JsonResponse(serializer.data, status = 200, )
    def put(self, request, pk):
        data = Donation.objects.get(id=pk)
        serializer = PostSerializer(data,request.data,partial=True)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status = 201)
        return JsonResponse(serializer.errors, status = 400)
    def delete(self, request, pk):
        donation = get_object_or_404(Donation, id =pk)
        donation.delete() 
        return JsonResponse(None, status= 200)

