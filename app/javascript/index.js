window.addEventListener('load', function(){

  let KeyUpPrice = document.getElementById("item-price")
  let KeyUpTax = document.getElementById("add-tax-price")
  let KeyUpProfit = document.getElementById("profit")

  KeyUpPrice.addEventListener('keyup', function(){
   let Price = KeyUpPrice.value;
   AddTax = Price * 0.1
   KeyUpTax.innerHTML = AddTax
   Profit = Price - AddTax
   KeyUpProfit.innerHTML = Profit
  })
})

