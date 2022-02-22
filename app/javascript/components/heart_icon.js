const toggleRed = () => {
  const buttons = document.querySelectorAll('.like-icon');
  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('red');
    });
  });
}

export { toggleRed };
