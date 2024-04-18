document.addEventListener("DOMContentLoaded", function() {
  const imageInput = document.getElementById('image');
  const preview = document.getElementById('preview');

  imageInput.addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        preview.src = e.target.result;
        preview.style.display = 'inline-block';
      };
      reader.readAsDataURL(file);
    }
  });
});
