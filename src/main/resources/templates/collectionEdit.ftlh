<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>
    <form action="/collectionEdit/${col.id}" method="post">
        <div class="mb-3">
            <label for="editName" class="form-label"><@spring.message"colName"/></label>
            <input type="text" class="form-control w-75 ${(nameError??)?string('is-invalid','')}"
                   value = "<#if collection??>${collection.name}<#else>${col.name}</#if>" name="name" id = "editName">
            <#if nameError??>
                <div class="invalid-feedback">
                    <@spring.message"${nameError}"/>
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label for="editDescription" class="form-label"><@spring.message"colDescription"/></label>
            <input type="text" class="form-control w-75"
                   value = "<#if collection??><#noautoesc>${collection.description}</#noautoesc><#else><#noautoesc>${col.description}</#noautoesc></#if>"
                   name="description" id ="editDescription">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary"><@spring.message"edit"/></button>
    </form>
</@c.page>