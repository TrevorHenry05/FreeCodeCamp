function convertToRoman(num) {
    let result = "";
    const roman = [    
      ["M", 1000],
      ["CM", 900],
      ["D", 500],
      ["CD", 400],
      ["C", 100],
      ["XC", 90],
      ["L", 50],
      ["XL", 40],
      ["X", 10],
      ["IX", 9],
      ["V", 5],
      ["IV", 4],
      ["I", 1]
    ];
    for (let i = 0; i < roman.length; i++) {
      while (num >= roman[i][1]) {
        result += roman[i][0];
        num -= roman[i][1];
      }
    }
    return result;
  
  }
  
  convertToRoman(36);