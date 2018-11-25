<#macro page urlPrefix>
<nav aria-label="Page navigation">
    <ul class="pagination">
        <li class="${posts.first?then('disabled', '')}">
            <a href="${urlPrefix}/${posts.number-1}" aria-label="Previous">
                <!--span aria-hidden="true">&laquo;</span-->
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <#list rainbow as num>
        <li class="${(num!=posts.number)?then('active', '')}">
            <a href="${urlPrefix}/${num}">${num}</a>
        </li>
        </#list>
        <li class="${posts.last?then('disabled', '')}">
            <a href="${urlPrefix}/${posts.number+1}" aria-label="Next">
                <!--span aria-hidden="true">&raquo;</span-->
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
</#macro>