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

    <div>
        <h2>Largest collection</h2>
    </div>
    <table class="table mt-2">
        <thead>
        <tr>
            <th scope="col">Collection name</th>
            <th scope="col">Owner</th>
            <th scope="col">Theme</th>
            <th scope="col">Size</th>
            <th scope="col">Descriprion</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="/collection/${maxSizeCollection.id}">${maxSizeCollection.name}</a></td>
            <td><a href="/personalPage/${maxSizeCollection.owner.id}">${maxSizeCollection.owner.username}</a></td>
            <td>${maxSizeCollection.theme}</td>
            <th>${maxSizeCollection.items?size}</th>
            <td><#noautoesc>${maxSizeCollection.getHtmlDescription()}</#noautoesc></td>
        </tr>
        </tbody>

    </table>

</@c.page>
