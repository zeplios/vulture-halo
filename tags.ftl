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

<div class="page-main container">
    <div class="col-md-9">
        <div class="content box">
            <h3>标签列表</h3>
            <ul class="uk-list uk-list-large uk-list-divider">
            <@commonTag method="tags">
                <#list tags?if_exists as tag>
                    <li><a href="/tags/${tag.tagUrl}">&nbsp;&nbsp;${tag.tagName} (${tag.posts?size})</a></li>
                </#list>
            </@commonTag>
            </ul>
        </div>

    </div>
    <div class="col-md-3">
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
