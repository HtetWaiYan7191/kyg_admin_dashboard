import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview"];

  connect() {
    console.log("connected");
  }

  preview() {
    console.log("file input change");
    this.previewTarget.innerHTML = ""; // Clear any existing images

    Array.from(this.inputTarget.files).forEach((file) => {
      const reader = new FileReader();

      reader.onload = (e) => {
        const img = document.createElement("img");
        img.src = e.target.result;
        img.classList.add("preview-image");
          img.classList.add("object-fit-cover");
        this.previewTarget.appendChild(img);
      };

      reader.readAsDataURL(file);
    });
  }
}
