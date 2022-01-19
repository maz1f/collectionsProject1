<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <div><h2>${col.name}</h2></div>
    <form action="/filter/${col.id}" method="post">
        <div class="input-group mb-4 mt-4 w-25">
            <input type="text" class="form-control" name = "tag" placeholder="tag"/>
            <button type="submit" class="btn btn-outline-secondary">Filter</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>

    <#if currentUser?? && (name == col.owner.username || currentUser.isAdmin())>
        <div class = "mb-4">
            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewItem" aria-expanded="false" aria-controls="addNewItem">
                Add new item
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
                                    ${nameError}
                                </div>
                            </#if>
                            <label for="putName">Item name</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   value = "<#if item??>${item.tag}</#if>" name ="tag" id="putTag" />
                            <label for="putTag">Item tag</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <button type="submit" class="btn btn-primary w-25 p-3">Add</button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </div>
    </#if>

    <div class="card-group">
        <#list items as item>
            <div class="card border-dark">
                <div class="card-body text-dark">
                    <h5 class="card-title">${item.name}</h5>
                    <p class="card-text">${item.tag}</p>
                </div>
                <div class="card-footer">
                    <#if currentUser?? && (name == col.owner.username || currentUser.isAdmin())>
                        <a class="btn btn-outline-dark" href="/editItem/${item.id}" role="button">Edit</a>
                        <a class="btn btn-outline-dark" href="/deleteItem/${item.id}" role="button">Delete</a>

                        <a href="/likeItem/${item.id}">
                            <#if !item.getLikes()?seq_contains(currentUser)>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                </svg>
                            <#else>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                </svg>
                            </#if>
                        </a>
                        ${item.getLikes()?size}

                    <#else><small class="text-muted">Read-Only</small>
                    </#if>
                </div>
            </div>
        <#else>
            <h5>Collection is empty</h5>
        </#list>
    </div>
</@c.page>
