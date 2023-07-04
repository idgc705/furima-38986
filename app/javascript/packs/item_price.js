
window.addEventListener('load', function () {
   const inputElement = document.getElementById("item-price")
   const addTaxPrice = document.getElementById("add-tax-price")
   const profitElement = document.getElementById("profit")
 
   inputElement.addEventListener('keyup', function () {
     const input_price = document.getElementById("item-price").value
     const tax_price = Math.floor(input_price * 0.1)
     const profit_price = input_price - tax_price
     addTaxPrice.innerHTML = tax_price
     profitElement.innerHTML = profit_price
   })
 })