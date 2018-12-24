<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <title>${options.blog_title}</title>
    <link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
    <link rel="stylesheet" href="/${themeName}/source/cdn/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/${themeName}/source/css/forkmark.lib.min.css">
    <link rel="stylesheet" href="/${themeName}/source/css/markdown.css">
</head>
<body>
<#include "common/nav.ftl"/>

<div class="page-banner page-banner-home">
</div>
<!-- /.page-banner -->

<div class="uk-section uk-container">
    <div uk-grid>
        <div class="uk-width-3-4@m uk-width-1-1">
            <h1 class="uk-article-title">${post.postTitle}</h1>
            <input style="display: none" id="postId" value="${post.postId}"/>
            <div class="uk-article-meta uk-margin-small-bottom">Modified on: ${post.postDate?string('yyyy-MM-dd')}</div>
            <div>
            <#--if post.categories?? && post.categories?size gt 0>
            <a class="doc_tag" href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
            </#if-->
            <#list post.tags as tag>
            <a class="uk-label uk-margin-small-right">${tag.tagName}</a>
            </#list>
            </div>
            <#if post.postThumbnail??>
            <figure class="post-full-image" style="background-image: url(${post.postThumbnail})"></figure>
            </#if>

            <div class="markdown">${post.postContent?if_exists}</div>

            <div style="margin:20px 0" id="comment-anchor">&nbsp;</div>

            <#-- If you want to embed comments, this is a good place to do it! -->
            <h3>文章评论</h3>
            <#include "comment.ftl">
        </div>

        <div class="uk-width-1-4@m">
        <#include "sidebar.ftl"/>
        </div>
    </div>
</div>
<div class="clear"></div>

<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="/${themeName}/source/js/sidebar.js"></script>
<script type="text/javascript" src="/${themeName}/source/js/comment.js"></script>
</body>
</html>
