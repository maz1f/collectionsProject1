<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<#import "spring.ftl" as spring>
<@c.page>

    <div id="comments">
        <h3><@spring.message"comments"/> ${item.name}:</h3>
        <#list comments as comment>
            <div class="card mb-1">
                <div class="card-body">
                    <h5 class="card-title">${comment.author.username}</h5>
                    <p class="card-text">${comment.comment}</p>
                </div>
            </div>
        </#list>
    </div>

    <#if name != "unknown">
        <div class = "mb-4 mt-4">
            <button class="btn btn-outline-dark" type="button" data-bs-toggle="collapse"
                    data-bs-target="#addNewComment" aria-expanded="false" aria-controls="addNewComment">
                <@spring.message"addComment"/>
            </button>
        </div>
        <div class="collapse mb-4" id = "addNewComment">
            <form id="commentsForm" name="commentsForm">
                <div class="row g-2 mb-5 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                   name ="comment" id="putComment" />
                            <label for="putComment"><@spring.message"yourComment"/></label>

                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <button type="submit" class="btn btn-dark p-3"><@spring.message"addComment"/></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </#if>
    <script>
        var commentsArea = document.querySelector('#comments');
        var commentForm = document.querySelector('#commentsForm');
        var commentInput = document.querySelector('#putComment');

        var stompClient = null;
        var username = null;

        var colors = [
            '#2196F3', '#32c787', '#00BCD4', '#ff5652',
            '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
        ];

        function connect() {

            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, onConnected, onError);
        }


        function onConnected() {
            // Subscribe to the Public Topic
            stompClient.subscribe('/topic/public', onMessageReceived);
        }


        function onError(error) {

        }


        function sendMessage(event) {
            var messageContent = commentInput.value.trim();
            if(messageContent && stompClient) {
                var comment = {
                    comment: commentInput.value,
                    author: "${name}",
                    item: ${item.id}
                };
                stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(comment));
                commentInput.value = '';
            }
            event.preventDefault();
        }

        function onMessageReceived(payload) {
            var comment = JSON.parse(payload.body);
            if (comment.item == "${item.id}") {
                var commentElement = document.createElement('div');
                commentElement.setAttribute('class', 'card mb-1');

                var commentBody = document.createElement('div');
                commentBody.setAttribute('class', 'card-body');

                var commentTitle = document.createElement('h5');
                commentTitle.setAttribute('class', 'card-title');

                var commentText = document.createElement('p');
                commentText.setAttribute('class', 'card-text');

                var username = document.createTextNode(comment.author);
                commentTitle.appendChild(username);

                var com = document.createTextNode(comment.comment);
                commentText.appendChild(com);

                commentBody.appendChild(commentTitle);
                commentBody.appendChild(commentText);

                commentElement.appendChild(commentBody);
                commentsArea.appendChild(commentElement);
            }
        }

        connect();
        commentForm.addEventListener('submit', sendMessage, true)
    </script>
</@c.page>