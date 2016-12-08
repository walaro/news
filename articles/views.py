from django.shortcuts import render
from django.http import HttpResponse
from .models import Article

def index(request):
	articles = Article.objects.order_by('-date_published')[:5]
	context = {'articles': articles}
	response = HttpResponse(content_type="application/xml; charset=utf-8")
	f = open('news_static/test.xml', encoding="utf-8")
	for line in f:
		response.write(line)
	f.close()
	return response