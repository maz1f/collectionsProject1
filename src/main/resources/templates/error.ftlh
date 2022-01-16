<#import "macroses/common.ftlh" as c>
<@c.page>
    <h1>OOPS...</h1>
    <h2>Something went wrong!</h2>
    <#if message??><h3>${message}</h3></#if>
    <a class="btn btn-primary" href="/" role="button">Go to main page</a>
</@c.page>