<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "macroses/like.ftlh" as l>
<#import "spring.ftl" as spring>
<@c.page>
    <div><h2>${col.name}</h2></div>
    <form action="/filter/${col.id}" method="post">
        <div class="input-group mb-4 mt-4 w-50">
            <input type="text" class="form-control" name = "tag" placeholder="<@spring.message"tag"/>"/>
            <button type="submit" class="btn btn-outline-secondary"><@spring.message"filter"/></button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>

    <div class="row g-2 mb-3">
        <div class="col-auto">
            <a class="btn btn-outline-secondary" href="/sortByName/${col.id}/1" role="button"><@spring.message"sortByName"/></a>
        </div>
        <div class="col-auto">
            <a class="btn btn-outline-secondary" href="/sortByName/${col.id}/0" role="button"><@spring.message"sortByNameDesc"/></a>
        </div>
    </div>

    <#if currentUser?? && (name == col.owner.username || currentUser.isAdmin())>
        <div class = "mb-4">
            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewItem" aria-expanded="false" aria-controls="addNewItem">
                <@spring.message"addNewItem"/>
            </button>
        </div>
        <div class="collapse <#if item??>show</#if> mb-4" id = "addNewItem">
            <form method="post" action="/addItem/${col.id}">
                <div class="row g-3 mb-5 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control ${(nameError??)?string('is-invalid','')}"
                                   value = "<#if item??>${item.name}</#if>" name = "name" id="putName" />
                            <#if nameError??>
                                <div class="invalid-feedback">
                                    <@spring.message"${nameError}"/>
                                </div>
                            </#if>
                            <label for="putName"><@spring.message"itemName"/></label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   value = "<#if item??>${item.tag}</#if>" name ="tag" id="putTag" />
                            <label for="putTag"><@spring.message"itemTag"/></label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <button type="submit" class="btn btn-primary w-25 p-3"><@spring.message"add"/></button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </div>
    </#if>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list items as item>
            <div class="col">
                <div class="card border-dark">
                    <div class="card-body text-dark">
                        <h5 class="card-title">${item.name}</h5>
                        <p class="card-text">${item.tag}</p>
                    </div>
                    <div class="card-footer">
                        <#if currentUser?? && (name == col.owner.username || currentUser.isAdmin())>
                            <a class="btn btn-outline-dark" href="/editItem/${item.id}" role="button"><@spring.message"edit"/></a>
                            <a class="btn btn-outline-dark" href="/deleteItem/${item.id}" role="button"><@spring.message"delete"/></a>
                        </#if>
                        <#if name != "unknown">
                            <@l.like item currentUser/>
                        </#if>
                        <a class="btn btn-outline-dark" href="/${item.id}/comments" role="button"><@spring.message"comments"/> (${item.comments?size})</a>

                    </div>
                </div>
            </div>
        <#else>
            <h5><@spring.message"colEmpty"/></h5>
        </#list>
    </div>
</@c.page>
