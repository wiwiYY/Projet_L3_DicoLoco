$(document).ready(function() {
    $.ajax({
        url: "localhost:8080/word/getAllWords"
    }).then(function(data) {
       $('.greeting-id').append(data.id);
       $('.greeting-content').append(data.content);
    });
});