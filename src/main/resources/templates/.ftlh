<#import "macroses/common.ftlh" as c>
<@c.page>
    <h1>Hello, it's main page of my project</h1>
    <div class = "mt-5">
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
