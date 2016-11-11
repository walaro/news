from django.contrib import admin
from .models import Article, ArticleAuthor, Tag, ArticleTag

admin.site.register(Article)
admin.site.register(ArticleAuthor)
admin.site.register(Tag)
admin.site.register(ArticleTag)
# Register your models here.
