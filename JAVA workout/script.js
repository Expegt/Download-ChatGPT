/* Detect numeric odd and even */

function oddOrEven(x) {
  
  if (!Number.isInteger(x) === true) {
    return console.error("Input Invalid");
  }
  
  if(x % 2 === 0) {
    console.log("The number is even");
  } else {
      console.log("The number is odd");
  }
}
  
  oddOrEven (1)
  oddOrEven (25)
  oddOrEven (2)
  oddOrEven (27)
oddOrEven (24)
oddOrEven (22)
oddOrEven (28)
