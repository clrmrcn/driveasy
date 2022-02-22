
const buttons = document.querySelectorAll('.like-icon');

const toggleRed = () => {
  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('red');
    });
  });
}

export { toggleRed };
