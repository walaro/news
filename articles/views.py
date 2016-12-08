from django.shortcuts import render
from django.http import HttpResponse
from .models import Article
from django.core import serializers

def index(request):
	articles = Article.objects.order_by('-date_published')[:5]
	context = {'articles': articles}
	response = HttpResponse(content_type="application/xml; charset=utf-8")
	f = open('news_static/test.xml', encoding="utf-8")
	data = serializers.serialize("xml", articles)

	data = "<?xml-stylesheet type=\"text/xsl\" href=\"/static/articles.xsl\"?>" + data
	response.write(data)
	print(data)
	f.close()
	return response