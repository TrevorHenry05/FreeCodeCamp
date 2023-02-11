function rot13(str) {
    let result = "";
    let regex = /[A-Za-z0-9]/i;
  
    for(let i = 0; i < str.length; i++) {
      let char = str[i].charCodeAt(0);
      if(regex.test(str[i])) {
        char -= 13;
        if(char < 'A'.charCodeAt(0)) {
          char = 'Z'.charCodeAt(0) - ('A'.charCodeAt(0) - char - 1);
        }
        result += String.fromCharCode(char);
      } else {
        result += str[i];
      } 
    }
    return result;
  }
  
  rot13("SERR PBQR PNZC");