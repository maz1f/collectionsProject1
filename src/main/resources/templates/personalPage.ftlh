<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <div class="mb-3">
        <h2>Personal page of ${owner.username}</h2>
    </div>
    <#if owner.equals(user) || user.isAdmin()>
        <form method="post" action="${owner.id}">
            <div class="row g-4 mb-5">
                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" name = "name" id="putName" />
                        <label for="putName">Collection name</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" name ="description" id="putDescr" />
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
    </#if>


    <div class="mb-3">
        <h4>${owner.username} collections:</h4>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Collection name</th>
            <th scope="col">Theme</th>
            <th scope="col">Descriprion</th>
            <th scope="col">Size</th>
            <#if owner.equals(user) || user.isAdmin()><th scope="col">Edit</th></#if>
            <#if owner.equals(user) || user.isAdmin()><th scope="col">Delete</th></#if>
        </tr>
        </thead>
        <tbody>
        <#list collections as col>
            <tr>
                <td><a href="/collection/${col.id}">${col.name}</a></td>
                <td>${col.theme}</td>
                <td>${col.description}</td>
                <td><#if col.items??>${col.items?size}<#else>0</#if></td>
                <#if owner.equals(user) || user.isAdmin()><td><a href="/collectionEdit/${col.id}">Edit</a></td></#if>
                <#if owner.equals(user) || user.isAdmin()><td><a href="/deleteCollection/${col.id}">Delete</a></td></#if>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>