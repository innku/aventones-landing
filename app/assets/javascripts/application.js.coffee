#= require jquery
#= require jquery_ujs
#= require app
#= require lib/backstretch
#= require lib/modal

images = [ "assets/backgrounds/1158482_26652572.jpg", "assets/backgrounds/1204516_14487555.jpg", "assets/backgrounds/1351192_87032549.jpg", "assets/backgrounds/1360987_65160656.jpg", "assets/backgrounds/1104290_82139418.jpg", "assets/backgrounds/1091826_19907901.jpg", "assets/backgrounds/1102202_80292401.jpg" ]
$(images).each ->
  $("<img/>")[0].src = this

index = 0
$.backstretch images[index],
  speed: 1400

setInterval (->
  index = (if (index >= images.length - 1) then 0 else index + 1)
  $.backstretch images[index]
), 5000