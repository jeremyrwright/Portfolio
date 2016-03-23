$(document).ready(function() {
  $('.myMenu ul li').hover(function() {  //top menu dropdown navigation
	   $(this).children('ul').stop(true, false, true).slideToggle(300);
  });

  $("#youtube").mouseover(function() {
    $(this).css("border", "red");
  });
  $("#youtube").mouseleave(function() {
    $(this).css("border", "yellow");
    $("*").unbind("mouseleave");
  });
/* for pre lightbox image toggle
  var imageName = [
    "images/face2.jpg",
    "images/face3.jpg",
    "images/face4.jpg",
    "images/face5.jpg",
    "images/face6.jpg",
    "images/face7.jpg",
    "images/face8.jpg",
    "images/face9.jpg",
    "images/face10.jpg"];
  var indexNum = 0;


  $("#picture").click(function() {

    $("#picture").fadeOut(300, function() {
      $("#picture").attr("src", imageName[indexNum]);
      indexNum++;
      if (indexNum > 8) {indexNum = 0;}
      $("#picture").fadeIn(500);
    });

  });
*/
});
