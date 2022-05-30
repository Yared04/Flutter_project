from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static
# from django.contrib.staticfiles import staticfiles_urlpatterns
urlpatterns = [
    path('posts' , posts, name='posts')
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

# urlpatterns += staticfiles_urlpatterns()
