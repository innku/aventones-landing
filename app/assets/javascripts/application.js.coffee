#= require jquery
#= require jquery_ujs
#= require app
#= require lib/bgstrecher
#= require lib/modal

$(document).ready ->
  $("body").bgStretcher
    images: [ "assets/backgrounds/1158482_26652572.jpg", "assets/backgrounds/1204516_14487555.jpg", "assets/backgrounds/1351192_87032549.jpg", "assets/backgrounds/1360987_65160656.jpg", "assets/backgrounds/1104290_82139418.jpg", "assets/backgrounds/1091826_19907901.jpg", "assets/backgrounds/1102202_80292401.jpg" ]
    transitionEffect: "fade"
    sequenceMode: "random"
    imageWidth: 1024
    imageHeight: 640
    nextSlideDelay: 8000
    slideShowSpeed: 4000
    resizeProportionally: true
