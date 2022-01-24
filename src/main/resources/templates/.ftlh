<#import "macroses/common.ftlh" as c>
<#import "spring.ftl" as spring>
<@c.page>

    <div class = "mb-4">
        <button class="btn btn-outline-secondary" type="button" data-bs-toggle="collapse"
                data-bs-target="#showTags" aria-expanded="false" aria-controls="showTags">
            <@spring.message"tagsCloud"/>
        </button>
    </div>

    <div class="collapse mb-4" id = "showTags">
        <#list tags as tag>
            <a href="/showByTag/${tag.id}">${tag.tagName}</a>
        </#list>
    </div>

    <div class = "mb-2">
        <h2><@spring.message"largestCol"/></h2>
    </div>

    <div class="card border-dark mb-5">
        <div class="card-header">
            <h3>${maxSizeCollection.name}</h3>
        </div>
        <div class="card-body text-dark">
            <p class="card-text"><#noautoesc>${maxSizeCollection.getHtmlDescription()}</#noautoesc></p>
        </div>
        <div class="card-footer">
            <div class="row g-2">
                <div class="col-auto">
                    <a href="/collection/${maxSizeCollection.id}" class="btn btn-dark"><@spring.message"showCol"/></a>
                </div>
                <div class="col-auto">
                    <small class="text-muted"><@spring.message"colSize"/>: ${maxSizeCollection.items?size}</small>
                </div>
            </div>
        </div>
    </div>
    <#if lastAddedItems??>
        <h3><@spring.message"lastAddedItems"/></h3>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <#list lastAddedItems as item>
                <div class="col">
                <div class="card border-dark">
                    <div class="card-body text-dark">
                        <h5 class="card-title">${item.name}</h5>
                        <p class="card-text">${item.tag}</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted"><@spring.message"collection"/>: ${item.collection.name}</small>
                    </div>
                </div>
                </div>
            </#list>
        </div>
    </#if>
</@c.page>
