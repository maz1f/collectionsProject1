<#import "macroses/common.ftlh" as c>
<@c.page>

    <div class = "mb-4">
        <button class="btn btn-outline-secondary" type="button" data-bs-toggle="collapse"
                data-bs-target="#showTags" aria-expanded="false" aria-controls="showTags">
            Tags cloud
        </button>
    </div>

    <div class="collapse mb-4" id = "showTags">
        <#list tags as tag>
            <a href="/showByTag/${tag.id}">${tag.tagName}</a>
        </#list>
    </div>

    <div class = "mb-2">
        <h2>Largest collection</h2>
    </div>

    <div class="card border-dark">
        <div class="card-header">
            <h3>${maxSizeCollection.name}</h3>
        </div>
        <div class="card-body text-dark">
            <p class="card-text"><#noautoesc>${maxSizeCollection.getHtmlDescription()}</#noautoesc></p>
            <a href="/collection/${maxSizeCollection.id}" class="btn btn-dark">Show collection</a>
        </div>
        <div class="card-footer">
            Collection size: ${maxSizeCollection.items?size}
        </div>
    </div>

</@c.page>
