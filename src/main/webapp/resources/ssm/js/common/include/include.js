// Main Menu Title 이미지 변경
function commonIncludeLeftMenuImageChange(type, objectName){
	if(type == "Parents"){
		$("li[id="+ objectName +"]").attr("class", "nav-item has-treeview menu-open");
		$("li[id="+ objectName +"]").children("a").attr("class", "nav-link active");
	} else if(type == "Child") {
		$("li[id="+ objectName +"]").children("a").attr("class", "nav-link active");
	}
}