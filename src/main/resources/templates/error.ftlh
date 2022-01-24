<#import "macroses/common.ftlh" as c>
<#import "spring.ftl" as spring>
<@c.page>
    <div class = "text-center">
        <h1><@spring.message"oops"/>...</h1>
        <h2><@spring.message"somethingWrong"/>!</h2>
        <#if message??><h3>${message}</h3></#if>
        <a class="btn btn-primary" href="/" role="button"><@spring.message"goMainPage"/></a>
    </div>

</@c.page>