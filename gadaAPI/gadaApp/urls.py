from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
# from rest_framework_simplejwt import views as jwt_views
# from django.contrib.staticfiles import staticfiles_urlpatterns
urlpatterns = [
    path('posts' , PostViewCreate.as_view(), name='posts'),
    path('posts/<str:pk>' , DetailPost.as_view(), name='posts-detail'),
    path('users' , ViewUser.as_view() , name = 'users'),
    path('delete-user/<str:pk>' , DeleteUser.as_view() , name='delete-user'),
    path('donations' , DonationCreate.as_view() , name = 'donations'),
    path('donations/<str:pk>' , DonationDetail.as_view() , name = 'donation-detail'),
    # path('api/token/', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # path('api/token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),

 
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

# urlpatterns += staticfiles_urlpatterns()
