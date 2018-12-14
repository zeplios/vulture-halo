<#include "default.ftl">
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

<div class="page-banner page-banner-subpage">
    <!-- <div class="container">
        <div class="banner-slogan banner-slogan-hero">
            <div class="banner-search">
                <form method="get">
                    <div class="input-icon">
                        <input name="query" class="form-control input-lg" module="text" placeholder="Search For Question..." value=""/>
                        <button class="btn btn-link btn-icon btn-lg" module="button"><i class="zmdi zmdi-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div> -->
</div>
<!-- /.page-banner -->

<div class="page-main container" id="articleArea" uk-grid>
    <div class="uk-width-3-4@m uk-width-1-1">
        <div class="doc_container">
            <div class="doc_header">
                <h1>${post.postTitle}</h1>
                <input style="display: none" id="postId" value="${post.postId}"/>
                <div class="uk-margin-small-bottom">Modified on: ${post.postDate?string('yyyy-MM-dd')}</div>
                <div>
                <#--if post.categories?? && post.categories?size gt 0>
                <a class="doc_tag" href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                </#if-->
                <#list post.tags as tag>
                    <a class="vl-badge uk-margin-small-right">${tag.tagName}</a>
                </#list>
                </div>
                <#if post.postThumbnail??>
                <figure class="post-full-image" style="background-image: url(${post.postThumbnail})"></figure>
                </#if>
            </div>
            <div class="doc_content">${post.postContent?if_exists}</div>
            <div class="doc_footer"></div>
        </div>

        <div style="margin:20px 0" id="comment-anchor">&nbsp;</div>

        <#-- If you want to embed comments, this is a good place to do it! -->
        <h3>文章评论</h3>
        <#include "comment.ftl">
    </div>

    <div class="uk-width-1-4@m">
        <#include "sidebar.ftl"/>
    </div>
</div>
<div class="clear"></div>
<hr class="hr50" />

<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="/${themeName}/source/js/sidebar.js"></script>
<script type="text/javascript" src="/${themeName}/source/js/comment.js"></script>
<script type="text/javascript">
    /*
    new Vue({
        el: '#articleArea', 
        mounted: function (argument) {
            this.$http.get('/article/rest/' + blogid).then((response) => {
                var resp = response.body;
                if (resp.code == 0) {
                    var essay = resp.data.item.content;
                    $essay = $('#essay_content');
                    if (essay[0] != '<') {
                        $essay.html(window.ForkMDE.parse(essay));
                    }
                    $essay.show(500);
                    return;
                } else {
                    alert(resp.message);
                }
            }).catch(function(response) {
                alert('网络错误');
                console.log(response)
            });
        }
    })*/
</script>
</body>
</html>
