<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>
    <h3><@spring.message"usersList"/>:</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col"><@spring.message"username"/></th>
            <th scope="col"><@spring.message"isAdmin"/></th>
            <th scope="col"><@spring.message"block"/></th>
            <th scope="col"><@spring.message"edit"/></th>
            <th scope="col"><@spring.message"delete"/></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td><a class="btn btn-outline-secondary" href="/personalPage/${user.id}" role="button">${user.username}</a></td>
                <td><#if user.isAdmin()><@spring.message"yes"/><#else><@spring.message"no"/></#if></td>
                <td>
                    <form action="/user/block/${user.id}" method="post">
                        <button type="submit" class="btn btn-outline-secondary"><#if user.isActive()><@spring.message"block"/><#else><@spring.message"unblock"/></#if></button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </td>
                <td>
                    <form action="/user/${user.id}" method="post">
                    <button type="submit" class="btn btn-outline-secondary"><@spring.message"edit"/></button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </td>
                <td>
                    <form action="/user/delete/${user.id}" method="post">
                        <button type="submit" class="btn btn-outline-secondary"><@spring.message"delete"/></button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>