from django.db import models
from author.models import AuthorProfile


class Article(models.Model):
	article_headline = models.CharField(max_length=256)
	article_ingress = models.TextField()
	html_article_content = models.TextField(default="")
	date_published = models.DateTimeField()


class ArticleAuthor(models.Model):
	article = models.ForeignKey(Article)
	author = models.ForeignKey(AuthorProfile)


class Tag(models.Model):
	tag = models.CharField(max_length=256)

class ArticleTag(models.Model):
	tag = models.ForeignKey(Tag)
	article  = models.ForeignKey(Article)


