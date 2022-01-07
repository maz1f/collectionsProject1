<#import "macroses/common.ftlh" as c>
<@c.page>
<div>
    <form class="row g-3" method="post">
        <div class="col-auto">
        <input type="text" class="form-control" name="name" placeholder="Put your name">
        </div>
        <div class="col-auto">
        <button type="submit" class="btn btn-primary mb-3">Confirm</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</div>
    <h4>hello, ${user}</h4>
</@c.page>