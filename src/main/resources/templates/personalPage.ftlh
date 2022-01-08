<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <h2>Hello, ${name}</h2>

    <form method="post">
        <div class="mb-3">
            <input type="text"  name = "name" placeholder="put collection name" />
        </div>
        <div class="mb-3">
            <input type="text" name ="description" placeholder="put description" />
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Add</button>
    </form>

    <h4>Your collections:</h4>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Collection Name</th>
            <th scope="col">Descriprion</th>
            <th scope="col">Owner</th>
        </tr>
        </thead>
        <tbody>
        <#list collections as col>
                <tr>
                    <td>${col.getName()}</td>
                    <td>${col.getDescription()}</td>
                    <td>${col.getOwner().getUsername()}</td>
                </tr>
        </#list>
        </tbody>

    </table>
</@c.page>