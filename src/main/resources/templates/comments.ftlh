<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>

    <div id="comments">
    </div>

    <#if name != "unknown">
        <div class = "mb-4 mt-4">
            <button class="btn btn-outline-dark" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewComment" aria-expanded="false" aria-controls="addNewComment">
                <@spring.message"addComment"/>
            </button>
        </div>
        <div class="collapse mb-4" id = "addNewComment">
            <form method="post" action="/comment/${item.id}">
                <div class="row g-2 mb-5 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   name ="comment" id="putComment" />
                            <label for="putComment"><@spring.message"yourComment"/></label>
                            <input type="hidden" name="author" value="${currentUser}" />
                            <input type="hidden" name="item" value="${item}" />
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <button type="submit" class="btn btn-dark w-25 p-3"><@spring.message"addComment"/></button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </div>
    </#if>
    <script>
        let newSize = 0;
        let size = ${item.comments?size};
        function checkSize() {
            $.ajax({
                type : 'GET',
                url : '/getSize/${item.id}',
                success : function(result) {
                    newSize = result;
                }
            });
            if (size < newSize) {
                show();
                size = newSize;
            }
        }
        function show() {
            $("#comments").load("/updateComments/${item.id}");
        }
        $(document).ready(function(){
            show();
            checkSize();
            setInterval('checkSize()',5000);
        });

    </script>
</@c.page>