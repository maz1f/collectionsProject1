<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <h3>Users List:</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">User name</th>
            <th scope="col">Roles</th>
            <th scope="col">Is Admin</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><#if user.isAdmin()>yes<#else>no</#if></td>
                <td><a href="/user/${user.id}">Edit</a></td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>