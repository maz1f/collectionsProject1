<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>
    <div class="row row-cols-1 row-cols-md-3 g-4">
    <#list collections as col>
        <div class="col">
            <div class="card border-dark">
                <div class="card-header">
                    <h3>${col.name}</h3>
                </div>
                <div class="card-body text-dark">
                    <p class="card-text"><#noautoesc>${col.getHtmlDescription()}</#noautoesc></p>
                </div>
                <div class="card-footer">
                    <a href="/collection/${col.id}" class="btn btn-dark"><@spring.message"showCol"/></a>
                    <a href="/personalPage/${col.owner.id}" class="btn btn-dark"><@spring.message"showOwner"/></a>
                </div>
            </div>
        </div>
    <#else>
        <h5><@spring.message"colListEmpty"/></h5>
    </#list>
</@c.page>