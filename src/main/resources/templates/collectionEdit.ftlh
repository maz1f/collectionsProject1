<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <form action="/collectionEdit/${col.getId()}" method="post">
        <input type="text" name="name" value="${col.getName()}">
        <input type="text" name="description" value="${col.getDescription()}">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary mb-3">Edit</button>
    </form>
</@c.page>