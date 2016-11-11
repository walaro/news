from django.shortcuts import render

from .models import Article

def index(request):
	articles = Article.objects.order_by('-date_published')[:5]
	context = {'articles': articles}
	return render(request, 'articles/index.html', context)