<div class="page-wrapper" id="Header">
    <div class="page-navbar">
        <nav class="navbar">
            <div class="container">
                <button class="navbar-toggle btn btn-link btn-icon" type="button">
                    <i>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </i>
                </button>
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">
                    <#if options.theme_vulture_nav_logo??>
                        <img class="site-logo" src="${options.theme_vulture_nav_logo}" alt="${options.blog_title}" />
                    <#elseif options.blog_logo??>
                        <img class="site-logo" src="${options.blog_logo}" alt="${options.blog_title}" />
                    <#else>
                        ${options.blog_title}
                    </#if>
                    </a>
                </div>
                <div class="navbar-container">
                    <ul class="nav navbar-nav navbar-main">
                        <li>
                            <a href="/">占位</a>
                        </li>

                        <@commonTag method="menus">
                        <#list menus as menu>
                        <li class="nav-${menu.menuName}" role="menuitem"><a href="${menu.menuUrl}">${menu.menuName}</a></li>
                        </#list>
                        </@commonTag>
                    </ul>
                    <!-- <ul class="nav navbar-buttons">
                        <li><a href="https://my.vultr.com" class="btn btn-outline btn-light">Log In</a></li>
                        <li><a href="/register/" class="btn btn-dark">Sign Up</a></li>
                    </ul> -->
                </div>
            </div>
        </nav>
    </div>
    <!-- /.page-navbar -->

    <!-- This is the modal -->
    <div id="modal-login" uk-modal>
        <div class="uk-modal-dialog uk-modal-body">
            <h2 class="uk-modal-title">请选择登录方式（仅限第三方登录）</h2>
            <div class="uk-child-width-expand@s uk-text-center uk-grid-match uk-margin-bottom" uk-grid>
                <div>
                    <div class="uk-background-primary uk-light uk-padding-small">
                        <a :href="oscLoginUrl">
                            <div><img src="/${themeName}/source/image/osc.svg" style="width: 80px" /></div>
                            <span>OSChina</span>
                        </a>
                    </div>
                </div>
                <div>
                    <div class="uk-background-primary uk-light uk-padding-small">
                        <a :href="weiboLoginUrl">
                            <div><img src="http://img.t.sinajs.cn/t4/appstyle/open/images/website/loginbtn/loginbtn_03.png" style="width: 100px"/></div>
                            <span>微博</span>
                        </a>
                    </div>
                </div>
                <div>
                    <div class="uk-background-primary uk-light uk-padding-small">
                        <a :href="githubLoginUrl">
                            <div><svg height="32" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg></div>
                            <span>Github</span>
                        </a>
                    </div>
                </div>
            </div>
            <p class="uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">取消</button>
            </p>
        </div>
    </div>

    <#--<script type="text/javascript">-->
        <#--var currentUserId = document.getElementById("current_user").children[0].user;-->
        <#--console.log("current user: " + currentUserId);-->
    <#--</script>-->
</div>