// preview page navigation script 

// (function($){ 
// 	//navigation menu 
// 	var sections=$("#authenty_preview>section");
// 	var headerOffset=$("header").outerHeight(true)-5;
// 	var extraOffset=Math.floor($(window).height()/4);
// 	var navMenuSel="#navigation_menu";
// 	var navMenuCurrSelClass="current-section";
// 	$.fn.NavigationMenu=function(speed,easing){
// 		var $this=$(this);
// 		var topPosition=$this.position().top;
// 		var updatePosition;
// 		$(window).scroll(function(){
// 			updatePosition=$(this).scrollTop()+topPosition;
// 			$this.stop(true,false).animate({top:updatePosition},speed,easing);
// 			$().NavigationMenuHighlight();
// 		});
// 	}
// 	$.fn.NavigationMenuHighlight=function(){
// 		var wScroll=$(window).scrollTop();
// 		sections.each(function(){
// 			var $this=$(this);
// 			var $id=$this.attr("id");
// 			var currMenuOption=$(navMenuSel+" a[href='#"+$id+"']");
// 			if(wScroll>=$this.offset().top-extraOffset && wScroll<$this.offset().top+($this.height()-extraOffset) && wScroll>headerOffset){
// 				currMenuOption.stop(true,true).addClass(navMenuCurrSelClass);
// 			}else{
// 				currMenuOption.stop(true,true).removeClass(navMenuCurrSelClass);
// 			}
// 		});
// 	}
// })(jQuery);


// jQuery.noConflict();
// (function($){
// 	/* functions to run when content loads */
// 	$(window).load(function(){
// 		$("#navigation_menu a,a[href='#top'],a[rel='m_PageScroll2id']").mPageScroll2id();
// 		$("#navigation_menu a,a[href='#top'],a[rel='m_PageScroll2id']").address();
// 		$.address.externalChange(function(event){ 
// 			if(event.value){
// 				var eVal=event.value.replace("/","");
// 				if(eVal===""){
// 					eVal="top";
// 				}
// 				//calling "history" method of mPageScroll2id and pass jquery address value
// 				$().mPageScroll2id("history",{
// 					scrollTo:eVal
// 				});
// 			}
// 		});
// 		$("#navigation_menu").NavigationMenu(1300,"easeOutExpo");
// 	});
// 	/* functions to run when browser is resized */
// 	$(window).resize(function(){
// 		//your functions here
// 	});
// })(jQuery);
