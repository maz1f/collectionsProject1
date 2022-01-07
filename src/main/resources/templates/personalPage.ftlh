<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <h2>Hello, ${name}</h2>
    <h4>Registrated users:</h4>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Username</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.getEmail()}</td>
                <td>${user.getUsername()}</td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>