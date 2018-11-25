<!DOCTYPE HTML>
<html lang="en-US">
<head>
<title>${options.blog_title}</title>
<link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
</head>
<body>
<#include "common/nav.ftl"/>

<div class="page-banner page-banner-home" id="header">
    <div class="banner-slogan">
        <div class="container">
            <h1 class="slogan-title">Welcome, Here is
            <#if options.theme_vulture_welcome_name??>${options.theme_vulture_welcome_name}<#else>${options.blog_title}</#if>
            </h1>
            <#if options.theme_vulture_welcome_email?default('false')=='true' && options.theme_vulture_sns_email??>
            <h2 class="slogan-desc">Email : ${options.theme_vulture_sns_email}</h2>
            </#if>
            <ul class="social">
                <#if options.theme_vulture_sns_rss?default('true')=='true'>
                <li><a class="rss" title="rss" href="/feed.xml" target="_blank"></a></li>
                </#if>

                <#if options.theme_vulture_sns_facebook??>
                <a class="facebook" title="facebook" href="https://www.facebook.com/${options.theme_vulture_sns_facebook}" target="_blank"></a>
                </#if>

                <#if options.theme_vulture_sns_twitter??>
                <li><a class="twitter" title="twitter" href="https://twitter.com/${options.theme_vulture_sns_twitter}" target="_blank"></a></li>
                </#if>

                <#if options.theme_vulture_sns_github??>
                <a class="github" title="github" href="https://github.com/${options.theme_vulture_sns_github}" target="_blank"></a>
                </#if>

                <li><a class="google" title="google+" href="https://plus.google.com/u/0/118043211116587592748/posts" target="_blank"></a></li>

                <#if options.theme_vulture_sns_cnblog??>
                <a class="cnblogs" title="博客园" href="https://www.cnblogs.com/${options.theme_vulture_sns_cnblog}/" target="_blank">
                </a>
                </#if>

                <li><a class="linkedin" title="linkedin" href="http://cn.linkedin.com/in/zhangfc" target="_blank"></a></li>
            </ul>
        </div>
    </div>
</div>

<div class="page-section section-center">
    <div class="container">
        <h2 class="section-title">系列文章</h2>

        <div class="services">
            <div class="row">
                <#list posts.content as post>
                <#-- The tag below includes the markup for each post - partials/post-card.hbs -->
                <#-- @post_card post></@post_card -->
                <div class="col-sm-4">
                    <a class="service" href="/archives/${post.postUrl}">
                        <#if post.postThumbnail??>
                        <img src="${post.postThumbnail}" uk-scrollspy="cls: uk-animation-scale-up; repeat: true" class="uk-box-shadow-medium uk-border-rounded" alt="" />
                        </#if>
                        <div class="service-body">
                            <#--if post.categories?? && post.categories?size gt 0>
                            <span class="post-card-tags">${post.categories[0].cateName}</span>
                            </#if-->
                            <h3>${post.postTitle}</h3>
                            <p>${post.postSummary?if_exists}</p>
                            <span class="icon-image">${post.postDate?string("yyyy-MM-dd")}</span>
                        </div>
                    </a>
                </div>
                </#list>
            </div>
        </div>
        <!--/ .services -->
    </div>
</div>
<!-- /.page-section -->
<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
</body>
</html>
