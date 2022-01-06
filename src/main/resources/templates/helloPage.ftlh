<#import "macroses/common.ftlh" as c>
<@c.page>
<div>
    <form method="post">
        <input type="text" name="name" placeholder="Введите ваше имя">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Отправить</button>
    </form>
</div>
<div>
    hello, ${user}
</div>
</@c.page>