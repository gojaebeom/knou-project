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
        
    if(tagContainer.childElementCount == 0)
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

//이전 값들 찾기위한 변수
let previous = [];

function doubleCheck(previousArr, value)
{
    for(let i = 0; i < previousArr.length; i++)
    {
        if(previousArr[i] == value)
        {
            
            return false;
        }
    }
}

console.log("총 태그들 : "+tagContainer.childElementCount);
console.log(tagContainer.children);

for(let i =0; i < tagContainer.childElementCount; i++)
{
    previous.push(tagContainer.children[i].dataset.value);
}

console.log(previous);

tagInput.onchange = () => 
{
    //태그 정규식
    const tagPattern = /^[가-힣a-zA-Z0-9]+$/;

    for(i=0;i < tagInput.value.length; i++) {
        let space = tagInput.value.substr(i,1);
        
        if (space ==" ")
        {
            let tagInputData = tagInput.value.split(" ");

            if(tagPattern.test(tagInputData[0]))
            {
                

                if(tagInputData[0].length < 2)
                {
                    alert("적어도 두글자 이상은 입력해야합니다😥");
                    tagInput.value="";
                    tagInput.focus();
                    return false;
                }
                if(tagInputData[0].length > 8)
                {
                    alert("8글자 이상은 입력할 수 없습니다😥");
                    tagInput.value="";
                    tagInput.focus();
                    return false;
                }

                //중복값 채크를 위한 함수
                const result = doubleCheck(previous, tagInputData[0]);

                if(result == false)
                {
                    alert("중복된 태그를 포함할 수 없습니다😥");
                    tagInput.value="";
                    tagInput.focus();
                    return false;
                }

                previous.push(tagInputData[0]);

                let tags = `
                <span class="badge badge-secondary p-2" data-value="${tagInputData[0]}" 
               		 onclick="deleteTag(this);" style="cursor:pointer;">${tagInputData[0]} x
                	<input type="hidden" id="tags" name="tags" value="${tagInputData[0]}"></input>
				</span>
                `;
                tagContainer.innerHTML += tags;
                tagInput.value = "";
                tagInput.focus();
            }
            else
            {
                alert("완성되지 않은 단어, 공백, 특수문자등이 포함될 수 없습니다😥");
                
                tagInput.value="";
                tagInput.focus();
                return false;
                
            }
        }
    }
}

function deleteTag(tag)
{
   const result = confirm( '태그를 삭제하시겠습니까? 삭제한 태그는 게시물 수정작업이 취소되어도 복구되지 않습니다😥' );
   if(!result)
   {
      return false;
   }

   console.log(tag.dataset);
   const tagValue = tag.dataset.value;
   const tagId = tag.dataset.id;

   console.log(previous);
   console.log(tagValue);
   console.log(tagId);
   
   //태그 삭제 이후에도 배열엔 값이 남아있어 똑같은 배열 이름 입력시 중복 경고가
   //나기때문에 같은 값을 가진 배열도 찾아서 삭제해준다
   for(let i = 0; i < previous.length; i++)
   {
       if(previous[i] == tagValue)
       {
           previous.splice(i, 1);
       }
   }
   console.log(previous);

   console.log(tag);
   console.log(tagId);

   //부모 태그 찾기
   const tagParent = tag.parentNode;

   //부모태그에서 자식태그 삭제
   tagParent.removeChild(tag);


   if(tagId != undefined)
   {
        $.ajax({
            type : "DELETE",
            url : `/tags/${tagId}`,
            contentType: "application/json; charset=utf-8;",
            dataType :"json",
            //async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
            error : function(){
                alert('통신실패!!');
            },
            success : function(data)
            {
                if(data)
                {
                    
                    
                    console.log("삭제 성공!");

                    //자식태그의 총 갯수 확인
                    console.log(`태그 컨테이너 ${tagContainer.childElementCount}`);
                }
            }
        });
   }

   
}






	
