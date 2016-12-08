from django.shortcuts import render
from django.http import HttpResponse
from .models import Article
from django.core import serializers

def index(request):
	articles = Article.objects.order_by('-date_published')[:5]
	context = {'articles': articles}
	response = HttpResponse(content_type="application/xml; charset=utf-8")
	data = serializers.serialize("xml", articles)
	stylesheet = "articles.xsl"

	leng = len("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
	data = data[0:leng] + "<?xml-stylesheet type=\"text/xsl\" href=\"/static/" + stylesheet + "\"?>" + data[leng:]
	response.write(data)
	return response