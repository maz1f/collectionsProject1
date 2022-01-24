<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>
    <div class="mb-3">
        <h2><@spring.message"personalPageTitle"/> ${owner.username}</h2>
    </div>
    <#if currentUser??>
        <#if owner.equals(currentUser) || currentUser.isAdmin()>
            <div class = "mb-4">
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                        data-bs-target="#addNewCollection" aria-expanded="false" aria-controls="addNewCollection">
                    <@spring.message"addCol"/>
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
                                        <@spring.message"${nameError}"/>
                                    </div>
                                </#if>
                                <label for="putName"><@spring.message"colName"/></label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-floating">
                                <input type="text" class="form-control"
                                       value = "<#if collection??>${collection.description}</#if>" name ="description" id="putDescr" />
                                <label for="putDescr"><@spring.message"colDescription"/></label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-floating">
                                <select class="form-select" name="theme" id="selectTheme">
                                    <option value="Alcohol"><@spring.message"alcohol"/></option>
                                    <option value="Marks"><@spring.message"marks"/></option>
                                    <option value="Books"><@spring.message"books"/></option>
                                </select>
                                <label for="selectTheme"><@spring.message"colTheme"/></label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-floating">
                                <button type="submit" class="btn btn-primary w-25 p-3"><@spring.message"create"/></button>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </form>
            </div>
        </#if>
    </#if>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list collections as col>
            <div class="col">
                <div class="card border-dark">
                    <div class="card-header">
                        <h3>${col.name}</h3>
                    </div>
                    <div class="card-body text-dark">
                        <p class="card-text"><#noautoesc>${col.getHtmlDescription()}</#noautoesc></p>
                    </div>
                    <div class="card-footer">
                        <a href="/collection/${col.id}" class="btn btn-dark"><@spring.message"showCol"/></a>
                        <#if currentUser??>
                            <#if owner.equals(currentUser) || currentUser.isAdmin()>
                                <a class="btn btn-outline-dark" href="/collectionEdit/${col.id}" role="button"><@spring.message"edit"/></a>
                                <a class="btn btn-outline-dark" href="/deleteCollection/${col.id}" role="button"><@spring.message"delete"/></a>
                            <#else><small class="text-muted"><@spring.message"colSize"/>: ${col.items?size}</small>
                            </#if>
                        <#else><small class="text-muted"><@spring.message"colSize"/>: ${col.items?size}</small>
                        </#if>
                    </div>
                </div>
            </div>
        <#else>
            <h5><@spring.message"colListEmpty"/></h5>
        </#list>
    </div>


</@c.page>