<#import "macroses/common.ftlh" as c>
<@c.page>
    <form method="post">
        <ul class="list-group">
            <li class="list-group-item">
                <input class="form-check-input me-1" type="checkbox" name = "idChecked" value="1" aria-label="...">
                Artem Volov
            </li>
            <li class="list-group-item">
                <input class="form-check-input me-1" type="checkbox" name = "idChecked" value="2" aria-label="...">
                Vadim Volov
            </li>
            <li class="list-group-item">
                <input class="form-check-input me-1" type="checkbox" name = "idChecked" value="3" aria-label="...">
                Abob Volov
            </li>
        </ul>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Tap here</button>
    </form>
    <div class = "mt-3">
        <h5>${message}</h5>
    </div>
</@c.page>