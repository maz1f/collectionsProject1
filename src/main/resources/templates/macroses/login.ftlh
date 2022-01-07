<#macro login path isRegistration>
    <form action="${path}" method="post">
        <#if isRegistration>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" name="email"/>
            </div>
        </#if>
        <div class="mb-3">
            <label class="form-label">User Name</label>
            <input type="text" class="form-control" name="username"/>
        </div>
        <div class = "mb-3">
            <label>Password</label>
            <input type="password" class="form-control" name="password"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary"><#if isRegistration>Registrate<#else>Sign In</#if></button>

    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name = "_csrf" value = "${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Sign Out</button>
    </form>
</#macro>
