<#include "security.ftlh">
<#import "login.ftlh" as l>
<#import "/spring.ftl" as spring>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><@spring.message"myCollection"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/"><@spring.message"home"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/allCollections"><@spring.message"collectionList"/></a>
                </li>
                <#if name == "unknown">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/login"><@spring.message"login"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/registration"><@spring.message"registration"/></a>
                    </li>
                    <#elseif currentUser?? && currentUser.isAdmin()>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/user"><@spring.message"usersList"/></a>
                        </li>
                </#if>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <@spring.message"changeLang"/>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${'?locale=en'}">EN</a></li>
                        <li><a class="dropdown-item" href="${'?locale=ru'}">RU</a></li>
                    </ul>
                </li>
            </ul>
            <#if name != "unknown">
                <a class="btn btn-outline-primary me-3 mb-2 mt-2" href="/personalPage/${currentUser.id}" role="button"><@spring.message"personalAcc"/></a>
                <@l.logout />
                <#else>
                    <@spring.message"readOnly"/>
            </#if>

        </div>
    </div>
    </div>
</nav>