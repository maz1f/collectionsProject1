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
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td><a href="/personalPage/${user.id}">${user.username}</a></td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><#if user.isAdmin()>yes<#else>no</#if></td>
                <td><form action="/user/${user.id}" method="post">
                        <button type="submit" class="btn btn-outline-secondary">Edit</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </td>
                <td><form action="/user/delete/${user.id}" method="post">
                        <button type="submit" class="btn btn-outline-secondary">Delete</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>