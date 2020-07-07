const title = document.getElementById("title");
const boardContent = document.getElementById("boardContent");

const tagInput = document.getElementById("tagInput");
const tagBtn = document.getElementById("tagBtn");
const tagContainer = document.getElementById("tagContainer");

console.log(title.value.length);
console.log(boardContent.value.length);

var STATUS = false;

//서브밋 이전 처리
function init()
{
    if(title.value === null || title.value.length === 0)
    {
        alert("제목을 입력해주세요😢")
        return false;
    }
        
    if(STATUS == false)
    {
        alert("태그는 하나 이상 등록해주세요😢")
        return false;
    }
    
    if(boardContent.value === null || boardContent.value.length === 0)
    {
        alert("내용을 입력해주세요😢")
        return false;
    }

    return true;
}

tagInput.onchange = () => 
{
    for(i=0;i < tagInput.value.length; i++) {
        let space = tagInput.value.substr(i,1);
        if (space == " ")
        {
           //공백일때 어떻게 처리해야 하나요..😰😰
           let a = tagInput.innerText;
           a.fontcolor = "red";
           return false;
        }
    }
}

//태그 버튼 클릭 이벤트
tagBtn.onclick = () =>
{
    let tags = `
    <span class="badge badge-primary p-2">${tagInput.value}</span>
    <input type="hidden" id="tags" name="tags" value="${tagInput.value}"></input>
    `;
    tagContainer.innerHTML += tags;
    tagInput.value = "";
    tagInput.focus();
    STATUS = true;
}






	
