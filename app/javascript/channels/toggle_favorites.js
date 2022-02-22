
const buttons = document.querySelectorAll('.like-icon');

function toggleLikeButton(buttons) {
  console.log('hello');
  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('red');
    });
  });
}

// toggleLikeButton(buttons);
// function toggleLikeButton(carId, innerHTML) {
//   let likeButton = document.querySelector(`.like-icon['data-id'='${carId}']`)
//   likeButton.classList.toggle('red');
// }
// toggleLikeButton(carId);
