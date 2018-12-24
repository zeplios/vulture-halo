<#include "common/page.ftl"/>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<title>${options.blog_title}</title>
<link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
</head>
<body>
<#include "common/nav.ftl"/>

<div class="page-banner">
    <div class="banner-slogan">
        <div class="container">
            <#if category?exists>
                <h2 class="slogan-desc">${category.cateName} : ${category.cateDesc}</h2>
            </#if>
        </div>
    </div>
</div>
<!-- /.page-banner -->

<div class="uk-section uk-container">
    <div uk-grid>
        <div class="uk-width-3-4@m uk-width-1-1">
            <#list posts.content?sort_by("postDate")?reverse as post>
            <div class="content box">
                <h3>
                    <#--<#if item.top gt 0>-->
                    <#--<span style="color:red">[置顶]</span>-->
                    <#--</#if>-->
                    <a href="${options.blog_url}/archives/${post.postUrl}">${post.postTitle}</a>
                    <span style="font-weight: normal">${post.postDate?string('MM月dd日')}</span>
                </h3>
                <p><span class="dropcap">${post.postSummary[0..0]}</span>${post.postSummary[1..]}...</p>
                <div class="clear"></div>
            </div>
            </#list>

            <@page urlPrefix="/categories/${category.cateUrl}/page"></@page>
        </div>

        <div class="uk-width-1-4@m uk-width-1-1">
        <#include "sidebar.ftl"/>
        </div>
    </div>
</div>
<!-- End Wrapper -->

<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="/${themeName}/source/js/sidebar.js"></script>
</body>
</html>
