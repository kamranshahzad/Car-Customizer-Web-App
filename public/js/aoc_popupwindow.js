//findPos function is from http://www.quirksmode.org/js/findpos.html;
//where its workings are explained in more detail.
function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}
 
//Display a named menu, at the position of another object
function display_menu(parent,named)
{
	
	//ev = event || window.event;
	//alert("Mouse X:"+ev.pageX + " Mouse Y:"+ev.pageY);
	//get the named menu
	document.getElementById("menu1").innerHTML=document.getElementById(named).innerHTML
	var menu_element = document.getElementById("menu1");
	//override the 'display:none;' style attribute
	menu_element.style.display = "";
	//get the placement of the element that invoked the menu...
	var placement = findPos(parent);
	//alert(placement[0]+' -- '+placement[1]);
	//...and put the menu there
	menu_element.style.left = placement[0] + "px";
	menu_element.style.top = placement[1] + "px";
}
 
//Hide a named menu
function hide_menu(named)
{
	//get the named menu
	var menu_element = document.getElementById(named);
	//hide it with a style attribute
	menu_element.style.display = "none";
}

 
 
 