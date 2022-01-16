<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <div class="mb-3">
        <h2>Personal page of ${owner.username}</h2>
    </div>
    <#if owner.equals(user) || user.isAdmin()>
        <div class = "mb-4">
            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewCollection" aria-expanded="false" aria-controls="addNewCollection">
                Add new collection
            </button>
        </div>
        <div class="collapse <#if collection??>show</#if> mb-4" id = "addNewCollection">
            <form method="post" action="/personalPage/${owner.id}">
                <div class="row g-4 mb-5">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control ${(nameError??)?string('is-invalid','')}"
                                   value = "<#if collection??>${collection.name}</#if>" name = "name" id="putName" />
                            <#if nameError??>
                                <div class="invalid-feedback">
                                    ${nameError}
                                </div>
                            </#if>
                            <label for="putName">Collection name</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   value = "<#if collection??>${collection.description}</#if>" name ="description" id="putDescr" />
                            <label for="putDescr">Collection description</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <select class="form-select" name="theme" id="selectTheme">
                                <option value="Alcohol">Alcohol</option>
                                <option value="Marks">Marks</option>
                                <option value="Books">Books</option>
                            </select>
                            <label for="selectTheme">Collection theme</label>
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

    <div class="mb-3">
        <h4>${owner.username} collections:</h4>
    </div>
    <div class="card-group">
        <#list collections as col>
            <div class="card border-dark">
                <div class="card-header">
                    <h3><a href="/collection/${col.id}">${col.name}</a></h3>
                </div>
                <div class="card-body text-dark">
                    <p class="card-text"><#noautoesc>${col.getHtmlDescription()}</#noautoesc></p>
                </div>
                <div class="card-footer">
                    <#if owner.equals(user) || user.isAdmin()>
                        <a class="btn btn-primary" href="/collectionEdit/${col.id}" role="button">Edit</a>
                        <a class="btn btn-primary" href="/deleteCollection/${col.id}" role="button">Delete</a>
                    <#else><small class="text-muted">Read-Only</small>
                    </#if>
                </div>
            </div>
        </#list>
    </div>


</@c.page>