from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='articles'),
    url(r'^(?P<pk>\d+)/edit$', views.edit_article, name='edit_article'),
]
