<#import "macroses/common.ftlh" as c>
<#import "macroses/login.ftlh" as l>
<@c.page>
    <h5>${message}</h5>
    <@l.login "/registration" true/>
</@c.page>