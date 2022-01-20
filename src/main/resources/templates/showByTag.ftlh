<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "macroses/like.ftlh" as l>
<@c.page>
    <div class="card-group">
        <#list items as item>
            <div class="card border-dark">
                <div class="card-body text-dark">
                    <h5 class="card-title">${item.name}</h5>
                    <p class="card-text">${item.tag}</p>
                </div>
                <div class="card-footer">
                    <#if name == "unknown">
                        <small class="text-muted">Read-Only</small>
                    <#else> <@l.like item currentUser/>
                    </#if>
                </div>
            </div>
        <#else>
            <h5>There are no items with this tag</h5>
        </#list>
    </div>
</@c.page>