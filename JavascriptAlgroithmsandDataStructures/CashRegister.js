function checkCashRegister(price, cash, cid) {
    const currencyUnits = {
      "PENNY": 0.01,
      "NICKEL": 0.05,
      "DIME": 0.1,
      "QUARTER": 0.25,
      "ONE": 1,
      "FIVE": 5,
      "TEN": 10,
      "TWENTY": 20,
      "ONE HUNDRED": 100
    };
    
    let changeDue = cash - price;
    let total = cid.reduce((acc, curr) => acc + curr[1], 0);
    total = Math.round(total * 100) / 100;
    
    if (total < changeDue) {
      return { status: "INSUFFICIENT_FUNDS", change: [] };
    }
    
    if (total === changeDue) {
      return { status: "CLOSED", change: cid };
    }
    
    let changearr = [];
    for (let i = cid.length - 1; i >= 0; i--) {
      let currName = cid[i][0];
      let currValue = currencyUnits[currName];
      let currCount = 0;
      
      while (changeDue >= currValue && cid[i][1] >= currValue) {
        changeDue = Math.round((changeDue - currValue) * 100) / 100;
        cid[i][1] = Math.round((cid[i][1] - currValue) * 100) / 100;
        currCount++;
      }
      
      if (currCount > 0) {
        changearr.push([currName, currValue * currCount]);
      }
    }
    
    if (changeDue > 0) {
      return { status: "INSUFFICIENT_FUNDS", change: [] };
    }
    
    return { status: "OPEN", change: changearr };
  }
  
  
  checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);