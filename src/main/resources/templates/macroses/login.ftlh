<#import "/spring.ftl" as spring>
<#macro login path isRegistration>
    <form action="${path}" method="post">
        <#if isRegistration>
            <div class="mb-3">
                <label class="form-label"><@spring.message"email"/></label>
                <input type="text" class="form-control ${(emailError??)?string('is-invalid','')}"
                       value = "<#if user??>${user.email}</#if>" name="email"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        <@spring.message"${emailError}"/>
                    </div>
                </#if>
            </div>
        </#if>
        <div class="mb-3">
            <label class="form-label"><@spring.message"username"/></label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid','')}"
                   value = "<#if user??>${user.username}</#if>" name="username"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    <@spring.message"${usernameError}"/>
                </div>
            </#if>
        </div>
        <div class = "mb-3">
            <label><@spring.message"password"/></label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid','')}"
                   name="password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    <@spring.message"${passwordError}"/>
                </div>
            </#if>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary"><#if isRegistration><@spring.message"registrate"/><#else><@spring.message"signIn"/></#if></button>

    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name = "_csrf" value = "${_csrf.token}" />
        <button type="submit" class="btn btn-outline-danger"><@spring.message"signOut"/></button>
    </form>
</#macro>
