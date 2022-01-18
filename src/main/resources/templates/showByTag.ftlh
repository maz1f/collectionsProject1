<#import "macroses/common.ftlh" as c>
<@c.page>
    <div class="card-group">
        <#list items as item>
            <div class="card border-dark">
                <div class="card-body text-dark">
                    <h5 class="card-title">${item.name}</h5>
                    <p class="card-text">${item.tag}</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Read-Only</small>
                </div>
            </div>
        <#else>
            <h5>There are no items with this tag</h5>
        </#list>
    </div>
</@c.page>