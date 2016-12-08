from django.db import models
from author.models import AuthorProfile


class Article(models.Model):
	article_headline = models.CharField(max_length=256)
	article_ingress = models.TextField()
	html_article_content = models.TextField(default="")
	date_published = models.DateTimeField()
	tags = models.TextField()

	def __str__(self):
		return self.article_headline


class ArticleAuthor(models.Model):
	article = models.ForeignKey(Article)
	author = models.ForeignKey(AuthorProfile)



class ArticleTag(models.Model):
    pass
	# tag = models.ForeignKey(Tag)
	# article = models.ForeignKey(Article)

	# def __str__(self):
	# 	return str(self.tag) + ", " + str(self.article)


