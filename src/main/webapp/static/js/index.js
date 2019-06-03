$(function(){

	//***********16校园环境**************
	$(".sch-banbox").FtCarousel({
		index: 0,
		auto: true,
		time: 4000,
		indicators: false,
		buttons: true
	});
//tab切换
	$(".school-btn>li").mouseover(function () {
		$(this).addClass("schbtn-on").siblings().removeClass("schbtn-on");
		var schindex = $(this).index();
		$('.school-tab .sch-banbox').eq(schindex).fadeIn(500).siblings('.sch-banbox').hide();
	});

$('.hdnav_more').mouseover(function(){
    $('.hdnav_more ul').show();
    $(this).find('p').addClass('on');
    $(this).find('img').hide();
    $(this).find('.more').show();
})
$('.hdnav_more').mouseout(function(){
    $('.hdnav_more ul').hide();
    $(this).find('p').removeClass('on');
    $(this).find('img').hide();
    $(this).find('.less').show();
})

$('.city_box').mouseover(function(){
    $('.citys').show();
    $(this).find('p').addClass('on');

})
$('.city_box').mouseout(function(){
    $('.citys').hide();
    $(this).find('p').removeClass('on');

})

// nav

$('.nli').mouseover(function(){
    $(this).find('h4').addClass('on');
    $(this).find('img').hide();
	$(this).find('.more').show();
	$(this).find('.nli_in').show();
})
$('.nli').mouseout(function(){
    $(this).find('h4').removeClass('on');
    $(this).find('img').hide();
	$(this).find('.less').show();
	$(this).find('.nli_in').hide();
})



$('.nli_in li').mouseover(function(){
    $(this).addClass('on');
})
$('.nli_in li').mouseout(function(){
    $(this).removeClass('on');
})

// nav_left
$('.nav_left li').mouseover(function(){
    $(this).find('.s').hide();
    $(this).find('.h').show();
    $(this).find('.span1').show();
    $(this).addClass('on');
    $(this).find('.nav_left_in').show();
    
})
$('.nav_left li').mouseout(function(){
    $(this).removeClass('on');
    $(this).find('.s').show();
    $(this).find('.h').hide();
    $(this).find('.span1').hide();
    $(this).find('.nav_left_in').hide();
})
// nav_left_in
$('.nav_left_in dd').mouseover(function(){
    $(this).find('.ss').hide();
    $(this).find('.hh').show();
    $(this).addClass('on');
})
$('.nav_left_in dd').mouseout(function(){
    $(this).removeClass('on');
    $(this).find('.ss').show();
    $(this).find('.hh').hide();
})


// banner
$(".zg_banner .hd").addClass('content');
$(".zg_banner .hd").find('li').html('');
$(".zg_banner").slide({mainCell:".bd ul",autoPlay:true,interTime:3000,mouseOverStop:true});

// 福利
$('.zg_fuli li').mouseover(function(){
	$(this).find('a').addClass('up');
    $(this).addClass('on');
})
$('.zg_fuli li').mouseout(function(){
	$(this).find('a').removeClass('up');
    $(this).removeClass('on');

})
// 推荐
// $(".zg_hot").slide({mainCell:".bd ul",autoPlay:true,interTime:3000,easing:"swing",effect:"leftLoop",mouseOverStop:true});
$(".zg_hot .hd").find('li').html('');
$('.p2_cont1 .right li').eq(0).addClass('on');
$('.p2_cont1 .left li').eq(0).addClass('on');


// 网课
$('.part3_top span').hide().eq(0).show();
// $('.p3_cont').find('.right').hide().eq(0).show();
$('.part3_top li').mouseover(function(){
    $('.part3_top li').removeClass('on');
    $('.part3_top span').hide();
    $(this).find('span').show();
    $(this).addClass('on');
	$('.p3_cont').find('.right').hide();
	$('.right_in').find('.right_inn').hide();
    $('.p3_cont').find('.right').eq($(this).index()).show();
})

$('.part3_top .chengxu').find('dd').mouseover(function(event) {
	event.stopPropagation();
});
$('.part3_top .chengxu').find('dd').mouseover(function(){

	$('.p3_cont').find('.right').hide();
	$('.p3_cont').find('.right_in').show();
	$('.right_in').find('.right_inn').hide();
    $('.right_in').find('.right_inn').eq($(this).index()).show();
})

// 课程中心
jQuery(".part4_slide").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"leftLoop",vis:8});
$('.part4_slide .bd li').mouseover(function(){
    $('.part4_slide .bd li').removeClass('on');
	$(this).addClass('on');
	$('.bd_text>ul').hide();
	$('.bd_text>ul').eq($(this).index()).show();
})
$('.part4_slide .hd span').mouseover(function(){
    $(this).find('.h').show().siblings().hide();
})
$('.part4_slide .hd span').mouseout(function(){
    $(this).find('.h').hide().siblings().show();
})




// 师资
jQuery(".shizi_slide").slide({mainCell:".bd ul",autoPage:true,effect:"left",vis:5});
$('.shizi_slide .bd').find('a').hide();
$('.shizi_slide').hide().eq(0).show();
$('.part5_top span').hide().eq(0).show();
$('.part5_top li').mouseover(function(){
    $('.part5_top li').removeClass('on');
    $('.part5_top span').hide();
    $(this).find('span').show();
    $(this).addClass('on');
    $('.shizi_slide').hide();
    $('.shizi_slide').eq($(this).index()).show();
})

$('.shizi_slide li').find('a').hide();
$('.shizi_slide span').mouseover(function(){
    $(this).find('.h').show().siblings().hide();
})
$('.shizi_slide span').mouseout(function(){
    $(this).find('.h').hide().siblings().show();
})

$('.shizi_slide li').mouseover(function(){
    $(this).addClass('in');
	$(this).find('a').show();
})
$('.shizi_slide li').mouseout(function(){
	$(this).removeClass('in');
	$(this).find('a').hide();
})

// 就业服务
$('.p8_cont').hide().eq(0).show();
$('.right p').mouseover(function(){
    $('.right p').removeClass('on');
    $(this).addClass('on');
    $('.p8_cont').hide();
    $('.p8_cont').eq($(this).index()).show();
})
// 名企合作

$('.p9_cont li').mouseover(function(){
  
    $(this).find('a').show();
})
$('.p9_cont li').mouseout(function(){
    $(this).find('a').hide();
   
})
// 教学环境
$('.p10_center').click(function(){
    $(this).hide();
    var sp_src = $(this).attr('link');
    $('.p10_cont .center').append('<iframe src="" frameborder="0" scrolling="no"  allowfullscreen="true"></iframe>').find('iframe').show().attr('src',sp_src);
    $('.zglh_jyxb li').find('iframe').remove();
})
$('.p10_cont li').mouseover(function(){
    $(this).find('div').show();
})
$('.p10_cont li').mouseout(function(){
    $(this).find('div').hide();
})

// 干货资料
$('.top_nav li').eq(0).addClass('on');
$('.p11_cont .text').hide().eq(0).show();
$('.top_nav li').mouseover(function(){
	$('.top_nav li').removeClass('on');
	$(this).addClass('on');
	$('.p11_cont .text').hide();
     $('.p11_cont .text').eq($(this).index()).show();
})
// 品牌荣誉
jQuery(".slider .bd li").first().before( jQuery(".slider .bd li").last() );
jQuery(".slider").hover(function(){ jQuery(this).find(".arrow").stop(true,true).fadeIn(300) },function(){ jQuery(this).find(".arrow").fadeOut(300) });
jQuery(".slider").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop",  autoPlay:true, vis:5, autoPage:true, trigger:"click"});


// footer
$('.footer_cont .top').find('li').mouseover(function(){
	$('.footer_cont .top').find('li').removeClass('on');
	$(this).addClass('on');
	$('.top_').hide();
	$('.top_').eq($(this).index()).show();
	$('.footer_cont .ft_btn').hide();
	$('.footer_cont .ft_btn').eq($(this).index()).show();
})
$('.peixun_more').click(function(){
	$('.peixun li').addClass('show2');
	$(this).hide();
	$('.peixun_less').show();
})
$('.peixun_less').click(function(){
	$('.peixun li').removeClass('show2');
	$(this).hide();
	$('.peixun_more').show();
})
$('.lianjie a').hide()
$('.lianjie a:lt(11)').show();
$('.lianjie_more').click(function(){
	$('.lianjie a').show();
	$(this).hide();
	$('.lianjie_less').show();
})
$('.lianjie_less').click(function(){
	$('.lianjie a').hide()
	$('.lianjie a:lt(11)').show();
	$(this).hide();
	$('.lianjie_more').show();
})

// 二维码

$('.ft_cont2 .right').find('li').mouseover(function(){
    $(this).addClass('on');
 
})
$('.ft_cont2 .right').find('li').mouseout(function(){
    $(this).removeClass('on');
 
})




// 浮窗

$('.flex li').mouseover(function(){
	$(this).find('em').hide();
	$('.flex li').find('span').hide();
	$(this).find('span').show();
	$('.flex li').removeClass('on');
	$(this).addClass('on');
})
$('.flex li').mouseout(function(){
	$(this).removeClass('on');
	$(this).find('em').show();
	$(this).find('span').hide();
	$('.flex').find('.l5').addClass('on');
	$('.flex .l5').find('span').show();
})
$(function () {
    $('.flex .l5').click(function(){
        $('body,html').animate({scrollTop:'0px'},600);
    }); 
})
})




// 就业服务右侧
function ZoomPic ()
{
	this.initialize.apply(this, arguments)	
}
ZoomPic.prototype = 
{
	initialize : function (id)
	{
		var _this = this;
		this.wrap = typeof id === "string" ? document.getElementById(id) : id;
		this.oUl = this.wrap.getElementsByTagName("ul")[0];
		this.aLi = this.wrap.getElementsByTagName("li");
		this.prev = this.wrap.getElementsByTagName("span")[0];
		this.next = this.wrap.getElementsByTagName("span")[1];
		/*this.timer = 1000;*/
		this.aSort = [];
		this.iCenter = 2;
		this._doPrev = function () {return _this.doPrev.apply(_this)};
		this._doNext = function () {return _this.doNext.apply(_this)};
		this.options = [
		
			{width:430, height:282, top:37, left:0, zIndex:2,opacity:0},
			{width:430, height:282, top:37, left:0, zIndex:2,opacity:0},
			{width:430, height:282, top:37, left:0, zIndex:2,opacity:50},
			{width:640, height:345, top:0, left:78, zIndex:3,opacity:100},
			{width:430, height:282, top:37, left:369, zIndex:2,opacity:50},
			{width:430, height:282, top:37, left:369, zIndex:2,opacity:0},
		
		];
		for (var i = 0; i < this.aLi.length; i++) this.aSort[i] = this.aLi[i];
		this.aSort.unshift(this.aSort.pop());
		this.setUp();
		this.addEvent(this.prev, "click", this._doPrev);
		this.addEvent(this.next, "click", this._doNext);
		this.doImgClick();		
		this.timer = setInterval(function ()
		{
			_this.doNext()	
		}, 3000);		
		this.wrap.onmouseover = function ()
		{
			clearInterval(_this.timer)	
		};
		this.wrap.onmouseout = function ()
		{
			_this.timer = setInterval(function ()
			{
				_this.doNext()	
			}, 3000);	
		}
	},
	doPrev : function ()
	{
		this.aSort.unshift(this.aSort.pop());
		this.setUp()
	},
	doNext : function ()
	{
		this.aSort.push(this.aSort.shift());
		this.setUp()
	},
	doImgClick : function ()
	{
		var _this = this;
		for (var i = 0; i < this.aSort.length; i++)
		{
			this.aSort[i].onclick = function ()
			{
				if (this.index > _this.iCenter)
				{
					for (var i = 0; i < this.index - _this.iCenter; i++) _this.aSort.push(_this.aSort.shift());
					_this.setUp()
				}
				else if(this.index < _this.iCenter)
				{
					for (var i = 0; i < _this.iCenter - this.index; i++) _this.aSort.unshift(_this.aSort.pop());
					_this.setUp()
				}
			}
		}
	},
	setUp : function ()
	{
		var _this = this;
		var i = 0;
		for (i = 0; i < this.aSort.length; i++) this.oUl.appendChild(this.aSort[i]);
		for (i = 0; i < this.aSort.length; i++)
		{
			this.aSort[i].index = i;
			if (i < 5)
			{
				this.css(this.aSort[i], "display", "block");
				this.doMove(this.aSort[i], this.options[i], function ()
				{
					_this.doMove(_this.aSort[_this.iCenter].getElementsByTagName("img")[0], {opacity:100}, function ()
					{
						_this.doMove(_this.aSort[_this.iCenter].getElementsByTagName("img")[0], {opacity:100}, function ()
						{
							_this.aSort[_this.iCenter].onmouseover = function ()
							{
								_this.doMove(this.getElementsByTagName("div")[0], {bottom:0})
							};
							_this.aSort[_this.iCenter].onmouseout = function ()
							{
								_this.doMove(this.getElementsByTagName("div")[0], {bottom:-100})
							}
						})
					})
				});
			}
			else
			{
				this.css(this.aSort[i], "display", "none");
				this.css(this.aSort[i], "width", 0);
				this.css(this.aSort[i], "height", 0);
				this.css(this.aSort[i], "top", 2);
				this.css(this.aSort[i], "left", this.oUl.offsetWidth / 2)
			}
			if (i < this.iCenter || i > this.iCenter)
			{
				this.css(this.aSort[i].getElementsByTagName("img")[0], "opacity", 100)
				this.aSort[i].onmouseover = function ()
				{
					_this.doMove(this.getElementsByTagName("img")[0], {opacity:100})	
				};
				this.aSort[i].onmouseout = function ()
				{
					_this.doMove(this.getElementsByTagName("img")[0], {opacity:100})
				};
				this.aSort[i].onmouseout();
			}
			else
			{
				this.aSort[i].onmouseover = this.aSort[i].onmouseout = null
			}
		}		
	},
	addEvent : function (oElement, sEventType, fnHandler)
	{
		return oElement.addEventListener ? oElement.addEventListener(sEventType, fnHandler, false) : oElement.attachEvent("on" + sEventType, fnHandler)
	},
	css : function (oElement, attr, value)
	{
		if (arguments.length == 2)
		{
			return oElement.currentStyle ? oElement.currentStyle[attr] : getComputedStyle(oElement, null)[attr]
		}
		else if (arguments.length == 3)
		{
			switch (attr)
			{
				case "width":
				case "height":
				case "top":
				case "left":
				case "bottom":
					oElement.style[attr] = value + "px";
					break;
				case "opacity" :
					oElement.style.filter = "alpha(opacity=" + value + ")";
					oElement.style.opacity = value / 100;
					break;
				default :
					oElement.style[attr] = value;
					break
			}	
		}
	},
	doMove : function (oElement, oAttr, fnCallBack)
	{
		var _this = this;
		clearInterval(oElement.timer);
		oElement.timer = setInterval(function ()
		{
			var bStop = true;
			for (var property in oAttr)
			{
				var iCur = parseFloat(_this.css(oElement, property));
				property == "opacity" && (iCur = parseInt(iCur.toFixed(2) * 100));
				var iSpeed = (oAttr[property] - iCur) / 5;
				iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
				
				if (iCur != oAttr[property])
				{
					bStop = false;
					_this.css(oElement, property, iCur + iSpeed)
				}
			}
			if (bStop)
			{
				clearInterval(oElement.timer);
				fnCallBack && fnCallBack.apply(_this, arguments)	
			}
		}, 30)
	}
};
window.onload = function ()
{
	new ZoomPic("focus_Box");
    new ZoomPic("focus_Box2");
	//$(".class_qidian_wpa").css({"left":"0","right":"auto","top":"auto","bottom":"0","marginTop":"auto"})
	
};





