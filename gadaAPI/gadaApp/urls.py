from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static
# from django.contrib.staticfiles import staticfiles_urlpatterns
urlpatterns = [
    path('posts' , PostViewCreate.as_view(), name='posts'),
    path('post-detail/<str:pk>' , DetailPost.as_view(), name='posts-detail'),
    path('users' , ViewUser.as_view() , name = 'users'),
    path('delete-user/<str:pk>' , DeleteUser.as_view() , 'delete-user')

] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

# urlpatterns += staticfiles_urlpatterns()
