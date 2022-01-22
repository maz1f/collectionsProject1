<#if comments?size != 0>
    <h3>${item.name} comments:</h3>
    <#list comments as comment>
        <div class="card mb-1">
            <div class="card-body">
                <h5 class="card-title">${comment.author.username}</h5>
                <p class="card-text">${comment.comment}</p>
            </div>
        </div>
    </#list>
    <#else>
        <h3>${item.name} has no comments</h3>
</#if>

