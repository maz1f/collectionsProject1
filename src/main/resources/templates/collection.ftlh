<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <div><h2>${col.name}</h2></div>
    <form action="/filter/${col.id}" method="post">
        <div class="input-group mb-3 mt-4 w-25">
            <input type="text" class="form-control" name = "tag" placeholder="tag"/>
            <button type="submit" class="btn btn-outline-secondary">Filter</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>

    <#if name == col.owner.username || user.isAdmin()>
    <div>
        <a class="btn btn-primary mb-3" href="/addItem/${col.id}" role="button">Add new Item</a>
    </div>
    </#if>
    <form action="/collection/${col.id}" method="post">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Item name</th>
                <th scope="col">Item tag</th>
                <#if name == col.owner.username || user.isAdmin()><th scope="col">Delete</th></#if>
            </tr>
            </thead>
            <tbody>
            <#list items as item>
                <tr>
                    <td>${item.name}</td>
                    <td>${item.tag}</td>
                    <#if name == col.owner.username || user.isAdmin()><td><a href="/deleteItem/${item.id}">Delete</a></td></#if>
                </tr>
            </#list>
            </tbody>
        </table>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>
