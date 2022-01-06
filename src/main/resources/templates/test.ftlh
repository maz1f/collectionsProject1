<#import "macroses/common.ftlh" as c>
<@c.page>
    <form method="post">
        <table>
            <caption><h3>Volovs list</h3></caption>
            <thead>
            <tr>
                <td><input type="checkbox" id = "selall"></td>
                <th>Name</th>
                <th>Lastname</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox" name = "idChecked" value="1"></td>
                <td>Artem</td>
                <td>Volov</td>
            </tr>
            <tr>
                <td><input type="checkbox" name = "idChecked" value="2"></td>
                <td>Abob</td>
                <td>Volov</td>
            </tr>
            <tr>
                <td><input type="checkbox"name = "idChecked" value="3"></td>
                <td>Vadim</td>
                <td>Volov</td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Нажмите пж</button>
    </form>
    <div>

    </div>
</@c.page>