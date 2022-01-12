<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <div><h2>${col.name}</h2></div>
    <form action="/filter/${col.getId()}" method="post">
        <div class="input-group mb-3 mt-4 w-25">
            <input type="text" class="form-control" name = "tag" placeholder="tag"/>
            <button type="submit" class="btn btn-outline-secondary">Filter</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>


    <form action="/collection/${col.getId()}" method="post">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Item name</th>
                <th scope="col">Item tag</th>
                <#if name == col.getOwner().getUsername() || user.isAdmin()><th scope="col">Delete</th></#if>
            </tr>
            </thead>
            <tbody>
            <#list items as item>
                <tr>
                    <td>${item.getName()}</td>
                    <td>${item.getTag()}</td>
                    <#if name == col.getOwner().getUsername() || user.isAdmin()><td><a href="/deleteItem/${item.getId()}">Delete</a></td></#if>
                </tr>
            </#list>
            </tbody>
        </table>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>
