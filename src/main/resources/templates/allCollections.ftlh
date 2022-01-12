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
            <th scope="col">Show collection</th>
        </tr>
        </thead>
        <tbody>
        <#list collections as col>
            <tr>
                <td>${col.name}</td>
                <td>${col.owner.username}</td>
                <td>${col.theme}</td>
                <th>${col.items?size}</th>
                <td>${col.description}</td>
                <td><a href="/collection/${col.id}">Show collection</a></td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>