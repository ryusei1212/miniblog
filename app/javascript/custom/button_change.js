window.addEventListener('turbo:load', () => {
  let submitButton = document.querySelector('.btn');
  let textArea = document.querySelector('#post_content');

  textArea.addEventListener('keyup', function() {
    if (textArea.value) {
      submitButton.classList.remove('disabled');
    }else {
      submitButton.classList.add('disabled');
    }
  });
})
