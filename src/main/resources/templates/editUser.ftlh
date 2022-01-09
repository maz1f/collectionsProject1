<#import "macroses/common.ftlh" as c>
<@c.page>
    <h3>User editor</h3>
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.getUsername()}">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" name="userId" value="${user.getId()}">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary mb-3">Edit</button>
    </form>
</@c.page>