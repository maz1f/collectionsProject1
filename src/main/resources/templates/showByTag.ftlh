<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "macroses/like.ftlh" as l>
<#import "spring.ftl" as spring>
<@c.page>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list items as item>
            <div class="col">
            <div class="card border-dark">
                <div class="card-body text-dark">
                    <h5 class="card-title">${item.name}</h5>
                    <p class="card-text">${item.tag}</p>
                </div>
                <div class="card-footer">
                    <#if name != "unknown">
                        <@l.like item currentUser/>
                    </#if>
                    <a class="btn btn-outline-dark" href="/${item.id}/comments" role="button"><@spring.message"comments"/> (${item.comments?size})</a>
                </div>
            </div>
            </div>
        <#else>
            <h5><@spring.message"itemsByTagEmpty"/></h5>
        </#list>
    </div>
</@c.page>