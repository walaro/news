from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from .models import Article
from django.core import serializers
from django import forms
import datetime

def index(request):
    articles = Article.objects.order_by('-date_published')[:5]
    data = serializers.serialize("xml", articles, use_natural_foreign_keys=True)
    first_line_end = data.find('\n')
    data = data[first_line_end+1:]
    return render(request, 'articles/articles.xml', {'xml_data':data}, content_type="text/xml")

def category(request, category):
    resultarticles = []
    articles = Article.objects.order_by('-date_published')[:5]
    for article in articles:
        if category in article.tags:
            resultarticles.append(article)
            print(article)

    response = HttpResponse(content_type="application/xml; charset=utf-8")
    data = serializers.serialize("xml", resultarticles, use_natural_foreign_keys=True)
    stylesheet = "articles.xsl"

    leng = len("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    data = data[0:leng] + "<?xml-stylesheet type=\"text/xsl\" href=\"/static/" + stylesheet + "\"?>" + data[leng:]
    response.write(data)
    return response

def view_article(request, pk):
    articles = [Article.objects.get(pk=pk)]
    response = HttpResponse(content_type="application/xml; charset=utf-8")
    data = serializers.serialize("xml", articles)
    stylesheet = "view-article.xsl"

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

