 var OutputDiv;
 function selectActions(value)
 {
  OutputDiv = document.getElementById("div1");
  OutputDiv.innerHTML="<h2>Loading...</h2>";

  new Ajax.Request('http://localhost/aoc/public/resourceaction/ajaxcall/',
   {
    method: "post",
    onComplete: Display,
	parameters:"resource="+value
   });
 }

 function Display(REQ)
 {
  OutputDiv.style.display="block";
  if (REQ.responseText.indexOf("Failed") != -1)
  {
   OutputDiv.className="Warning";
   OutputDiv.innerHTML=REQ.responseText;
  }
  else
  {
   OutputDiv.innerHTML=REQ.responseText;
  }
 }

 
