<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
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
                    <a href="/collection/${col.id}" class="btn btn-dark">Show collection</a>
                    <a href="/personalPage/${col.owner.id}" class="btn btn-dark">Show owner</a>
                </div>
            </div>
        </div>
    <#else>
        <h5>Collection list is empty</h5>
    </#list>
</@c.page>