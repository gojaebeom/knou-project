const imgFile = document.getElementById("imgFile");

imgFile.onchange = () =>
{
    
    console.log($('#imgFile')[0].files[0]);
    
    var form = $('#userForm')[0];
    console.log(form);
    var formData = new FormData(form);
    formData.append("imgFile", $("#imgFile")[0].files[0]);

    $.ajax({
        type : "POST",
        url : "image",
        processData: false,
        contentType: false,
        data : formData,
        dataType :"json",
        success : function(data)
        {   
            if(data)
            {
                console.log("요청옴");
            } 
            else
            {
                console.log("요청오옴");
            }
        },
        error : function()
        {
            alert('통신실패!!');
        },
    });
}

