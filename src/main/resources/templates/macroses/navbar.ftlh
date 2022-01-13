<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">MyCollections</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/test">Test</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/helloPage">Say Hello</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/allCollections">Collections List</a>
                </li>
                <#if name == "unknown">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/registration">Registration</a>
                    </li>
                    <#elseif user.isAdmin()>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/user">UsersList</a>
                        </li>
                </#if>

            </ul>
            <#if name != "unknown">
                <a class="nav-link" aria-current="page" href="/personalPage/${user.id}">
                    Personal Account
                </a>
                <@l.logout />
            </#if>

        </div>
    </div>
    </div>
</nav>