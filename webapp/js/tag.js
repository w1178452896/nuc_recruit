window.onload = function() {
  //用户首页侧栏
  function h() {
    return window.innerHeight ? winHeight = window.innerHeight : document.body && document.body.clientHeight && (winHeight = document.body.clientHeight), document.documentElement && document.documentElement.clientHeight && (winHeight = document.documentElement.clientHeight), winHeight
  }! function(h) {
    h.fn.hoverDelay = function(c) {
      var a, $, v = {
          hoverDuring: 200,
          outDuring: 200,
          hoverEvent: function() {
            h.noop()
          },
          outEvent: function() {
            h.noop()
          }
        },
        b = h.extend(v, c || {}),
        g = this;
      return h(this).each(function() {
        h(this).hover(function() {
          clearTimeout($), a = setTimeout(function() {
            b.hoverEvent.apply(g)
          }, b.hoverDuring)
        }, function() {
          clearTimeout(a), $ = setTimeout(function() {
            b.outEvent.apply(g)
          }, b.outDuring)
        })
      })
    }
  }(jQuery), $("#sidebar .menu_box").each(function(i) {
    $(this).hoverDelay({
      hoverDuring: 200,
      hoverEvent: function() {
        switch (i) {
          case 1:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).prev().position().top + 120
            }).removeClass("dn");
            break;
          case 2:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).prev().position().top
            }).removeClass("dn");
            break;
          case 3:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).position().top + $(this).height() - $(this).children(".menu_sub").height() + 64
            }).removeClass("dn");
            break;
          case 4:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).position().top + $(this).height() - $(this).children(".menu_sub").height() + 24
            }).removeClass("dn");
            break;
          case 5:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).position().top + $(this).height() - $(this).children(".menu_sub").height() + 30
            }).removeClass("dn");
            break;
          case 6:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).position().top + $(this).height() - $(this).children(".menu_sub").height() - 24
            }).removeClass("dn");
            break;
          default:
            $(this).addClass("current").children(".menu_sub").css({
              top: $(this).position().top
            }).removeClass("dn")
        }
      },
      outEvent: function() {
        $(this).removeClass("current").children(".menu_sub").addClass("dn")
      }
    })
  });
  var c = $("#sidebar").offset(),
    a = h() - $("#footer").height(),
    v = $("#sidebar").height();
  $("#loginToolBar").size() > 0 && (a -= $("#loginToolBar").height()), $(window).scroll(function() {
    var h = $(window).scrollTop();
    h >= c.top && a > v ? $("#sidebar").addClass("fixed") : $("#sidebar").removeClass("fixed")
  }), $("#container").css("min-height", $("#sidebar").height()), $(".mainNavs a").click(function(e) {
    e.preventDefault();
    var h = $(this),
      c = h.attr("href");
    window.location.href = c ;
  });


  //用户首页中栏
  var tag = document.getElementById("jobTab").children; //获取Tag下的li，即Tag标签 
  var content = document.getElementById("jobList").children; //获取Tag标签对应的内容 
  content[0].style.display = "block";
  content[1].style.display = "none"; //默认显示第一个标签的内容 
  var len = tag.length;
  for (var i = 0; i < len; i++) //无论点击谁都能实现当前显示，其余隐藏
  {
    tag[i].index = i; //为何如此？（看下面解释） 
    tag[i].onclick = function() //0级DOM的事件句柄注册

    {

      for (var n = 0; n < len; n++)

      {
        tag[n].className = "";
        content[n].style.display = "none";
      } //首先将全部的div隐藏
      tag[this.index].className = "current";
      content[this.index].style.display = "block";
    }
  }

};

