document.addEventListener('DOMContentLoaded', function () {
  const priceInput = document.getElementById('item-price'); // 販売価格の入力フィールド
  const feeOutput = document.getElementById('add-tax-price'); // 販売手数料表示用の要素
  const profitOutput = document.getElementById('profit'); // 販売利益表示用の要素

  // 販売価格が変更されたときの処理
  document.addEventListener('input', function () {
    const price = document.getElementById('item-price').value; // 販売価格を数値
    const fee = Math.floor(price * 0.1); // 販売手数料（10%）
    const profit = Math.floor(price - fee); // 販売利益

    feeOutput.innerHTML = fee;
    profitOutput.innerHTML = profit;
  });
});