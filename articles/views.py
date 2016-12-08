from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from .models import Article
from django.core import serializers
from django import forms
import datetime
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
class ArticleForm(forms.ModelForm):
    date_published = forms.DateTimeField(initial=datetime.datetime.now)
    class Meta:
        model = Article
        fields = '__all__'

def edit_article(request, pk, template_name='articles/article_form.html'):
    article = get_object_or_404(Article, pk=pk)
    form = ArticleForm(request.POST or None, instance=article)
    if form.is_valid():
        form.save()
        return redirect('articles')
    return render(request, template_name, {'form':form})
