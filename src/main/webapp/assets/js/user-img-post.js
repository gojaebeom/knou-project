const imgFile = document.getElementById("imgFile");
const userImage = document.getElementById('userImage');
const accountImage = document.getElementById('accountImage');

imgFile.onchange = () =>
{    
    var form = $('#userForm')[0];

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
            console.log(data.image);
            alert("이미지가 업로드 되었습니다!");
            userImage.src = `/images/${(data.image !== null)?data.image:'default.png'}`;
            accountImage.src = `/images/${(data.image !== null)?data.image:'default.png'}`;
        },
        error : function()
        {
            alert('시스템의 문제로 이미지를 업로드하지 못하였습니다.😥');
        },
    });
}

