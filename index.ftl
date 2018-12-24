<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <title>${options.blog_title}</title>
    <link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
</head>
<body>
<#include "common/nav.ftl"/>

<div class="page-banner page-banner-home">
    <div class="uk-container">
        <h2 class="uk-margin-medium-top uk-margin-bottom">Welcome, Here is
        <#if options.theme_vulture_welcome_name??>${options.theme_vulture_welcome_name}<#else>${options.blog_title}</#if>
        </h2>
        <#if options.theme_vulture_welcome_email?default('false')=='true' && options.theme_vulture_sns_email??>
        <h3 class="uk-visible@s">Email : ${options.theme_vulture_sns_email}</h3>
        </#if>
        <ul class="uk-iconnav uk-margin-bottom uk-visible@s">
            <#if options.theme_vulture_sns_rss?default('true')=='true'>
            <li><a class="uk-icon-button" title="rss" href="/feed.xml" target="_blank">
                <i class="fa fa-rss" aria-hidden="true"></i>
            </a></li>
            </#if>

            <#if options.theme_vulture_sns_facebook??>
            <li><a class="uk-icon-button" title="facebook" href="https://www.facebook.com/${options.theme_vulture_sns_facebook}" target="_blank">
                <i class="fa fa-facebook" aria-hidden="true"></i>
            </a></li>
            </#if>

            <#if options.theme_vulture_sns_twitter??>
            <li><a class="uk-icon-button" title="twitter" href="https://twitter.com/${options.theme_vulture_sns_twitter}" target="_blank">
                <i class="fa fa-twitter" aria-hidden="true"></i>
            </a></li>
            </#if>

            <#if options.theme_vulture_sns_github??>
            <li><a class="uk-icon-button" title="github" href="https://github.com/${options.theme_vulture_sns_github}" target="_blank">
                <i class="fa fa-github" aria-hidden="true"></i>
            </a></li>
            </#if>

            <li><a class="uk-icon-button" title="google+" href="https://plus.google.com/u/0/118043211116587592748/posts" target="_blank">
                <i class="fa fa-google-plus" aria-hidden="true"></i>
            </a></li>

            <#if options.theme_vulture_sns_cnblog??>
            <li><a uk-icon="icon: bold; ratio: 0.7" class="uk-icon-button" title="博客园" href="https://www.cnblogs.com/${options.theme_vulture_sns_cnblog}/" target="_blank">
            </a></li>
            </#if>

            <li><a class="uk-icon-button" title="linkedin" href="http://cn.linkedin.com/in/zhangfc" target="_blank">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
            </a></li>
        </ul>
    </div>
</div>

<div class="uk-section">
    <div class="uk-container">
        <h3 class="uk-text-center">系列文章</h3>

        <div class="archive-items uk-child-width-1-3@m uk-child-width-1-1@s">
            <#list posts.content as post>
            <#-- The tag below includes the markup for each post - partials/post-card.hbs -->
            <#-- @post_card post></@post_card -->
                <div class="archive-item uk-text-center">
                    <a href="/archives/${post.postUrl}" class="uk-link-reset">
                        <#if post.postThumbnail??>
                        <img src="${post.postThumbnail}" uk-scrollspy="cls: uk-animation-scale-up; repeat: true"
                             class="uk-box-shadow-medium uk-border-rounded" alt="" />
                        </#if>
                        <div>
                        <#--if post.categories?? && post.categories?size gt 0>
                        <span class="post-card-tags">${post.categories[0].cateName}</span>
                        </#if-->
                            <h4 class="uk-margin-top">${post.postTitle}</h4>
                            <p>${post.postSummary?if_exists}</p>
                            <span class="uk-text-primary">${post.postDate?string("yyyy-MM-dd")}</span>
                        </div>
                    </a>
                </div>
            </#list>
        </div>
    </div>
</div>

<!-- /.page-section -->
<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="http://cdn.zfcyc.com/masonry-layout@4/4.2.2/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="http://cdn.zfcyc.com/imagesloaded@4/4.1.4/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="/${themeName}/source/js/index.js"></script>
</body>
</html>
