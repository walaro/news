from django.db import models
from author.models import AuthorProfile

# Create your models here.
All tables below have an id integer field which is the primary key. 


class Article(models.Model):
	article_headline = models.CharField()
	article_ingress = models.TextField()
	html_article_content = models.CharField(default="")
	date_published = models.DateTimeField()


class ArticleAuthor(models.Model):
	article = models.ForeignKey(Article)
	author = models.ForeignKey(AuthorProfile)


class ArticleTag(models.Model):
	tag = models.ForeignKey(Tag)
	article  = models.ForeignKey(Article)



class Tag(models.Model):
	tag = models.CharField()
