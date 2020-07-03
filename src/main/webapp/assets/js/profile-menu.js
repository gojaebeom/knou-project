
var content = document.getElementById("content-li");
var subMenu = document.getElementById("sub-menu");

window.onload = function()
{
	if(subMenu !== null)
		subMenu.style.display = "none";
}

if(content !== null){
	content.onclick = function()
	{
	   	subMenu.style.display = (subMenu.style.display == "none") ? "block" : "none";
	}
}


//document.onmousedown = function leftClick() 
//{  
//	if(subMenu.style.display == "block")
//	{
//		subMenu.style.display = "none";
//	}
//};







	
