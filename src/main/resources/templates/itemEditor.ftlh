<#import "macroses/common.ftlh" as c>
<@c.page>
    <form action="/editItem/${currentItem.id}" method="post">
        <div class="mb-3">
            <label for="editName" class="form-label">Item name</label>
            <input type="text" class="form-control w-25 ${(nameError??)?string('is-invalid','')}"
                   value = "<#if item??>${item.name}<#else>${currentItem.name}</#if>" name="name" id = "editName">
            <#if nameError??>
                <div class="invalid-feedback">
                    ${nameError}
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label for="editTag" class="form-label">Item tag</label>
            <input type="text" class="form-control w-25"
                   value = "<#if item??>${item.tag}<#else>${currentItem.tag}</#if>"
                   name="tag" id ="editTag">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</@c.page>