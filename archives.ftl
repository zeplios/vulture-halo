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
</div>
<!-- /.page-banner -->

<div class="uk-section uk-container">
    <div  uk-grid>
        <div class="uk-width-3-4@m">
        <@articleTag method="archives">
            <#list archives as archive>
            <h3>${archive.year}年${archive.month}月</h3>
                <#list archive.posts?sort_by("postDate")?reverse as post>
            <div>
                <h4>
                <#--<#if item.top gt 0>-->
                <#--<span style="color:red">[置顶]</span>-->
                <#--</#if>-->
                    ${post.postDate?string('MM月dd日')}：<a href="${options.blog_url}/archives/${post.postUrl}">${post.postTitle}</a>
                </h4>
            </div>
                </#list>
            </#list>
        </@articleTag>

        <#--<#include "common/page.html"/>-->
        </div>
        <div class="uk-width-1-4@m">
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
