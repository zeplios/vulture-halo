<!DOCTYPE HTML>
<html lang="en-US">
<head>
<title>${options.blog_title}</title>
<link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
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

<div class="page-main container" uk-grid>
    <div class="uk-width-3-4@m">
        <@articleTag method="archives">
        <#list archives as archive>
            <h2>${archive.year}年${archive.month}月</h2>
            <#list archive.posts?sort_by("postDate")?reverse as post>
            <div>
                <h3>
                    <#--<#if item.top gt 0>-->
                    <#--<span style="color:red">[置顶]</span>-->
                    <#--</#if>-->
                    ${post.postDate?string('MM月dd日')}：<a href="${options.blog_url}/archives/${post.postUrl}">${post.postTitle}</a>
                </h3>
                <#--<span class="dropcap">${post.postSummary[0..0]}</span>${post.postSummary[1..]}</p>-->
                <div class="clear"></div>
            </div>
            </#list>
        </#list>
        </@articleTag>

        <#--<#include "common/page.html"/>-->
    </div>
    <div class="uk-width-1-4@m">
        <#include "sidebar.ftl"/>
    </div>
    <div class="clear"></div>
</div>
<!-- End Wrapper -->

<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="/${themeName}/source/js/sidebar.js"></script>
</body>
</html>
