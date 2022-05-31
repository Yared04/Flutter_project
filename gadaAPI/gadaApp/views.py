from email.mime import image
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse , JsonResponse
from grpc import StatusCode
from rest_framework.parsers import JSONParser
from rest_framework import APIView
from django.views.decorators.csrf import csrf_exempt
import json

from yaml import serialize
from gadaApp.serializers import PostSerializer
from .models import Post, Donation

# Create your views here.
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

