
var carId = '<%=car.id%>'

function toggleLikeButton(carId, innerHTML) {
  let likeButton = document.querySelector(`.like-icon['data-id'='${carId}']`)
  likeButton.classList.toggle('red');
}
toggleLikeButton(carId);
