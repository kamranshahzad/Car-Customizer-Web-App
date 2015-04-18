$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});
	
	// form functions
	$('.ask').click(function(e) {
					
		  e.preventDefault();
		  thisHref	= $(this).attr('href');
		  
		  if($(this).next('div.question').length <= 0)
			  $(this).after('<div class="question">Are you sure?<br/> <span class="yes">Yes</span><span class="cancel">Cancel</span></div>');
		  
		  $('.question').animate({opacity: 1}, 300);
		  
		  $('.yes').live('click', function(){
			  window.location = thisHref;
		  });
		  
		  $('.cancel').live('click', function(){
			  $(this).parents('div.question').fadeOut(300, function() {
				  $(this).remove();
			  });
		  }); 
	  });
	
	
});


