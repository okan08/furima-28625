window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const tax = Math.floor(inputValue * 0.1)

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax

    const profitDom = document.getElementById("profit")
    profitDom.innerHTML = inputValue - tax
  })
});