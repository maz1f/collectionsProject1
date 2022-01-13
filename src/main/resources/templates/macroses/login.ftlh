<#macro login path isRegistration>
    <form action="${path}" method="post">
        <#if isRegistration>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" class="form-control ${(emailError??)?string('is-invalid','')}"
                       value = "<#if user??>${user.email}</#if>" name="email"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </#if>
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid','')}"
                   value = "<#if user??>${user.username}</#if>" name="username"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label>Password</label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid','')}"
                   name="password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
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
