/**
 * Created by Rustem Zhunusov on 8/14/14.
 */

function callAjax(urlToP){
    $.ajax({
        url: urlToP,
        type:"post",
        dataType: 'json',
//          data:{ids:JSON.stringify(idList), option:option, id:id}
        success: function(data) {
            console.log(data); //<-----this logs the data in browser's console
        },
        error: function(xhr){
            alert(xhr.responseText); //<----when no data alert the err msg
        }
    });
}

function callAjaxWithParam(urlToCall, paramInJson){
    $.ajax({
        url: urlToCall,
        type: "post",
        dataType: 'json',
        data: paramInJson,
        contentType:"application/json; charset=utf-8",
        success: function(data) {
            console.log(data); //<----- this logs the data in browser's console
        },
        error: function(xhr){
            alert(xhr.responseText); //<---- when no data alert the err msg
        }
    });
}
