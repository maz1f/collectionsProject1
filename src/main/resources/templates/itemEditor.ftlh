<#import "macroses/common.ftlh" as c>
<#import "spring.ftl" as spring>
<@c.page>
    <form action="/editItem/${currentItem.id}" method="post">
        <div class="mb-3">
            <label for="editName" class="form-label"><@spring.message"itemName"/></label>
            <input type="text" class="form-control w-50 ${(nameError??)?string('is-invalid','')}"
                   value = "<#if item??>${item.name}<#else>${currentItem.name}</#if>" name="name" id = "editName">
            <#if nameError??>
                <div class="invalid-feedback">
                    <@spring.message"${nameError}"/>
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label for="editTag" class="form-label"><@spring.message"itemTag"/></label>
            <input type="text" class="form-control w-50"
                   value = "<#if item??>${item.tag}<#else>${currentItem.tag}</#if>"
                   name="tag" id ="editTag">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary"><@spring.message"edit"/></button>
    </form>
</@c.page>