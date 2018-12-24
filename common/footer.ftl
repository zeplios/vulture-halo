<footer id="footer" class="">
    <hr class="uk-margin-large-bottom"/>

    <div class="uk-container">
        <div class="uk-child-width-1-4@s uk-child-width-1-2" uk-grid>
            <div>
                <h4>友链</h4>
                <ul class="uk-list">
                    <li v-for="link in links"><a :href="link.linkUrl">{{link.linkName}}</a></li>
                </ul>
            </div>
            <div>
                <h4>博客</h4>
                <ul class="uk-list">
                    <li><a href="/#">会持续更新</a></li>
                </ul>
            </div>
            <div>
                <h4>资源</h4>
                <ul class="uk-list">
                    <li><a href="/#">FAQ</a></li>
                </ul>
            </div>
            <div>
                <h4>网站</h4>
                <ul class="uk-list">
                    <li><a href="/contact/">联系我</a></li>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>

    <hr class="uk-margin-large-top uk-margin-bottom"/>

    <div class="uk-container" uk-grid>
        <div class="uk-width-1-2@m uk-width-1-1@s">
            <!--ul class="nav">
                <li><a href="/legal/tos/">Terms of Service</a></li>
                <li><a href="/legal/use_policy/">AUP / DMCA</a></li>
                <li><a href="/legal/privacy/">Privacy Policy</a></li>
            </ul-->
            <!--ul class="social">
                <li><a href="https://www.facebook.com/Vultr/" class="btn btn-primary btn-circle btn-icon btn-outline btn-sm"><i class="zmdi zmdi-facebook"></i></a></li>
                <li><a href="https://www.twitter.com/vultr/" class="btn btn-primary btn-circle btn-icon btn-outline btn-sm"><i class="zmdi zmdi-twitter"></i></a></li>
            </ul-->
        </div>
        <div class="uk-width-1-2@m uk-width-1-1@s">
            <p class="footer-copyright uk-padding-small uk-padding-remove-top">
                Copyright ${options.theme_vulture_copyright_since?default('2018')} &copy; ${options.blog_title}. All rights reserved.
                        <#if options.theme_vulture_record_number??><small>备案号：${options.theme_vulture_record_number}</small></#if>
            </p>
        </div>
    </div>
</footer>
