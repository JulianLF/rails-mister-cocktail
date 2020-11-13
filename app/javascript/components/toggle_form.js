const toggleReviewsForm = () => {
  const button = document.querySelector('.toggle-reviews-form');
  const form = document.querySelector('#new-review');
  button.addEventListener('click', (event) => {
    form.classList.toggle('d-none');
    if (form.classList.contains('d-none')) {
      button.innerHTML = 'Add a review';
    } else {
      button.innerHTML = 'Hide form';
    }
  })
}

const toggleDosesForm = () => {
  const button = document.querySelector('.toggle-doses-form');
  const form = document.querySelector('#new-dose');
  button.addEventListener('click', (event) => {
    form.classList.toggle('d-none');
    if (form.classList.contains('d-none')) {
      button.innerHTML = 'Add an ingredient';
    } else {
      button.innerHTML = 'Hide form';
    }
  })
}

export { toggleReviewsForm, toggleDosesForm };
