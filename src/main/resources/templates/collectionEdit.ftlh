<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <form action="/collectionEdit/${col.id}" method="post">
        <div class="mb-3">
            <label for="editName" class="form-label">Collection name</label>
            <input type="text" class="form-control w-25 ${(nameError??)?string('is-invalid','')}"
                   value = "<#if collection??>${collection.name}<#else>${col.name}</#if>" name="name" id = "editName">
            <#if nameError??>
                <div class="invalid-feedback">
                    ${nameError}
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label for="editDescription" class="form-label">Collection description</label>
            <input type="text" class="form-control w-25"
                   value = "<#if collection??>${collection.description}<#else>${col.description}</#if>"
                   name="description" id ="editDescription">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</@c.page>