<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
    <#list comments as comment>
        <div class="card mb-1">
            <div class="card-body">
                <h5 class="card-title">${comment.author.username}</h5>
                <p class="card-text">${comment.comment}</p>
            </div>
        </div>
    </#list>
    <#if name != "unknown">
        <div class = "mb-4 mt-4">
            <button class="btn btn-outline-dark" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewComment" aria-expanded="false" aria-controls="addNewComment">
                Add new comment
            </button>
        </div>
        <div class="collapse mb-4" id = "addNewComment">
            <form method="post" action="/comment/${item.id}">
                <div class="row g-2 mb-5 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   name ="comment" id="putComment" />
                            <label for="putComment">Your comment</label>
                            <input type="hidden" name="author" value="${currentUser}" />
                            <input type="hidden" name="item" value="${item}" />
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <button type="submit" class="btn btn-dark w-25 p-3">Add comment</button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </div>
    </#if>
</@c.page>