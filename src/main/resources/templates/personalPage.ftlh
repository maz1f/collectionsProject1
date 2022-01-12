<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <h2>Hello, ${name}</h2>

    <form method="post">
        <div class="row g-4 mb-5 mt-2">
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

    <h4>Your collections:</h4>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Collection name</th>
            <th scope="col">Theme</th>
            <th scope="col">Descriprion</th>
            <th scope="col">Size</th>
            <th scope="col">Edit</th>
            <th scope="col">Show items</th>
            <th scope="col">Add new item</th>
        </tr>
        </thead>
        <tbody>
        <#list collections as col>
            <tr>
                <td>${col.getName()}</td>
                <td>${col.getTheme()}</td>
                <td>${col.getDescription()}</td>
                <td>${col.getSize()}</td>
                <td><a href="/collectionEdit/${col.getId()}">Edit</a></td>
                <td><a href="/collection/${col.getId()}">Show Items</a></td>
                <td><a href="/addItem/${col.getId()}">Add</a></td>
            </tr>
        </#list>
        </tbody>

    </table>
</@c.page>