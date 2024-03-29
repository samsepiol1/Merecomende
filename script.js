var ratedIndex = -1, uID1 = 0;

$(document).ready(function () {
    resetStarColors();

    if (localStorage.getItem('ratedIndex') != null) {
        setStars(parseInt(localStorage.getItem('ratedIndex')));
        uID = localStorage.getItem('uID');
    }

    $('.fa-star').on('click', function () {
       ratedIndex = parseInt($(this).data('index'));
       localStorage.setItem('ratedIndex', ratedIndex);
       saveToTheDB();
    });

    $('.fa-star').mouseover(function () {
        resetStarColors();
        var currentIndex = parseInt($(this).data('index'));
        setStars(currentIndex);
    });

    $('.fa-star').mouseleave(function () {
        resetStarColors();

        if (ratedIndex != -1)
            setStars(ratedIndex);
    });
});

function saveToTheDB() {
    $.ajax({
       url: "stars.php",
       method: "POST",
       dataType: 'json',
       data: {
           save: 1,
           uID: uID,
           ratedIndex: ratedIndex
       }, success: function (r) {
            uID = r.id;
            localStorage.setItem('uID', uID);
       }
    });
}

function setStars(max) {
    for (var i=0; i <= max; i++)
        $('.fa-star:eq('+i+')').css('color', 'yellow');
}

function resetStarColors() {
    $('.fa-star').css('color', 'white');
}


function postReply(commentId) {
        $('#commentId').val(commentId);
        $("#name").focus();
    }

    $("#submitButton").click(function () {
           $("#comment-message").css('display', 'none');
        var str = $("#frm-comment").serialize();

        $.ajax({
            url: "comment-add.php",
            data: str,
            type: 'post',
            success: function (response)
            {
                var result = eval('(' + response + ')');
                if (response)
                {
                    $("#comment-message").css('display', 'inline-block');
                    $("#name").val("");
                    $("#comment").val("");
                    $("#commentId").val("");
                    listComment();
                } else
                {
                    alert("Failed to add comments !");
                    return false;
                }
            }
        });
    });
    
    $(document).ready(function () {
           listComment();
    });

    function listComment() {
        $.post("comment-list.php",
                function (data) {
                       var data = JSON.parse(data);
                    
                    var comments = "";
                    var replies = "";
                    var item = "";
                    var parent = -1;
                    var results = new Array();

                    var list = $("<ul class='outer-comment'>");
                    var item = $("<li>").html(comments);

                    for (var i = 0; (i < data.length); i++)
                    {
                        var commentId = data[i]['comment_id'];
                        parent = data[i]['parent_comment_id'];

                        if (parent == "0")
                        {
                            comments = "<div class='comment-row'>"+
                            "<div class='comment-info'><span class='commet-row-label'>from</span> <span class='posted-by'>" + data[i]['comment_sender_name'] + " </span> <span class='commet-row-label'>at</span> <span class='posted-at'>" + data[i]['date'] + "</span></div>" + 
                            "<div class='comment-text'>" + data[i]['comment'] + "</div>"+
                            "<div><a class='btn-reply' onClick='postReply(" + commentId + ")'>Reply</a></div>"+
                            "</div>";

                            var item = $("<li>").html(comments);
                            list.append(item);
                            var reply_list = $('<ul>');
                            item.append(reply_list);
                            listReplies(commentId, data, reply_list);
                        }
                    }
                    $("#output").html(list);
                });
    }

    function listReplies(commentId, data, list) {
        for (var i = 0; (i < data.length); i++)
        {
            if (commentId == data[i].parent_comment_id)
            {
                var comments = "<div class='comment-row'>"+
                " <div class='comment-info'><span class='commet-row-label'>from</span> <span class='posted-by'>" + data[i]['comment_sender_name'] + " </span> <span class='commet-row-label'>at</span> <span class='posted-at'>" + data[i]['date'] + "</span></div>" + 
                "<div class='comment-text'>" + data[i]['comment'] + "</div>"+
                "<div><a class='btn-reply' onClick='postReply(" + data[i]['comment_id'] + ")'>Reply</a></div>"+
                "</div>";
                var item = $("<li>").html(comments);
                var reply_list = $('<ul>');
                list.append(item);
                item.append(reply_list);
                listReplies(data[i].comment_id, data, reply_list);
            }
        }
    }
