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
            <th scope="col">Items</th>
        </tr>
        </thead>
        <tbody>
        <#list collections as col>
            <tr>
                <td>${col.getName()}</td>
                <td>${col.getOwner().getUsername()}</td>
                <td>${col.getTheme()}</td>
                <th>${col.getSize()}</th>
                <td>${col.getDescription()}</td>
                <td><a href="/showItems/${name}/${col.getName()}">Show Items</a></td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>