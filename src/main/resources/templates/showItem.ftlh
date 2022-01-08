<#import "macroses/common.ftlh" as c>
<@c.page>
    <h3>Items in ${col}:</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Item name</th>
            <th scope="col">Item tag</th>
        </tr>
        </thead>
        <tbody>
        <#list items as item>
            <tr>
                <td>${item.getName()}</td>
                <td>${item.getTag()}</td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>