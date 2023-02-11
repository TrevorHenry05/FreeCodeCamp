function palindrome(str) {
    str = str.toLowerCase();
    str = str.replace(/[^A-Za-z0-9]/g, "");
    let l = 0, r = str.length - 1;
    while(l < r) {
      if(str[l] !== str[r]) {
        return false;
      }
  
      l++;
      r--;
    }
  
    return true;
  }
  
  palindrome("eye");