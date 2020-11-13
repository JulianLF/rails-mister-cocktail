const toggleReviewsForm = () => {
  const button = document.querySelector('.toggle-reviews-form');
  const form = document.querySelector('#new-review');
  button.addEventListener('click', (event) => {
    form.classList.toggle('d-none');
  })
}

const toggleDosesForm = () => {
  const button = document.querySelector('.toggle-doses-form');
  const form = document.querySelector('#new-dose');
  button.addEventListener('click', (event) => {
    form.classList.toggle('d-none');
  })
}

export { toggleReviewsForm, toggleDosesForm };
