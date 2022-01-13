<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <h3>Collections List:</h3>
    <table class="table">
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
        <#list collections as col>
            <tr>
                <td><a href="/collection/${col.id}">${col.name}</a></td>
                <td><a href="/personalPage/${col.owner.id}">${col.owner.username}</a></td>
                <td>${col.theme}</td>
                <th>${col.items?size}</th>
                <td>${col.description}</td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>