// This sets a listener on the element with the ID getFibonacciResult, so that
// when the button is clicked, it calls the FibonacciStart function.
window.onload = function(){
  document.querySelector("#getFibonacciResult").addEventListener("click", FibonacciStart);
  document.querySelector("#StarButton").addEventListener("click",StarMatch);
}


// This function simply returns the nth number of the fibonacci sequence using recursion.
function fib(n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fib(n - 1) + fib(n - 2);
};

// This function takes the value stored in the element with the ID of FibonacciSubmit
// and sets the result into the element with the ID FibonacciResult.
function FibonacciStart() {
  console.log("Called FibStart");
  var fibonacciResult = fib(document.querySelector('#FibonacciSubmit').value);
  document.querySelector('#FibonacciResult').value = fibonacciResult;
};


function Examples() {
    
  // Variables
  //
  // JavaScript is loosely or dynamically typed. This means the types can change at run time.
  //
  // Var is global or function scoped
  var bob = 1;
  // let is block scoped
  let george = "Fire";
  // const is block scoped, and cannot be changed once assigned a value
  const fred = "Mercury is the best pop star of all time."

  // Datatypes
  //
  // Primitives
  // String
  bob = "Bob";
  // Number
  // Number allows for a variety of numbers, including floating point numbers, e-notation, octals and hexadecimal.
  bob = 55;
  bob = 2.1;
  bob = 2.3e4; // 2.3000
  bob = 0o45; // 37
  bob = 0xf; // 15
  // It also allows for NaN, or not a number. Basically, not a valid number.
  bob = NaN;
  // Boolean
  // a true/false value
  bob = true;
  // Undefined
  // When a variable is declared but never intialized it is undefined.
  var dan;
  // null
  // null is similar to undefined, and if we compare the two it will return true.
  fred = null;
  // Symbol
  // This is a weirder datatype, suffice to say everytime you call symbol it gets a unique value.
  // You can then use these unique values internally.
  bob = symbol();
  //
  // complex datatypes
  // Object
  bob = {
    name:'Bob Bobson',
    genre:'Jazz'
  }
  console.log(bob.name);
  // Collections
  // Collections include Arrays, and objects.
  // Array
  bob[3,4,5,89];
  console.log(bob[2]);

  // Control Flow statements
  // If
  if(bob.length() < 1000) {

  } else if(true) {

  }
  // switch
  switch(bob[0]) {
    case 4:
      // code
      break;
    case 3:
      console.log('Hello from the switch!');
      break;
    default:
      console.log('Default!');
  }
  // Loops
  // Loops include for, while, do-while loops.
  // Beyond those we already know, we also have for-of and for-in. These should be familiar once we see them in action.
  for(var element of bob){
    // Yes, we are going to cycle through the values of our array called bob!
  }
  // for in is similar except it cycles through the properties of an object.
  bob = {a:1, b:2, c:3, d:5};
  for(let property in bob) {

  }

  // Truthy/Falsy
  // When dealing with our data types we have the concept of truthy and falsy, 
  // which is the boolean value of the data when used in an expression. 
  // All values are truthy, unless one of the below.
  // false, 0, ''(empty string), null, undefined, and NaN are falsy values.
}

function StarMatch() {  
  // The console allows us to log things, similar to how we use the system.debug in apex.
  console.log("Function Called");  
  // AJAX
    let xhr = new XMLHttpRequest();
    console.log("XHR Made");
    xhr.onreadystatechange = function() {
        console.log(this.readyState);
        console.log(this.status);
    if (this.readyState == 4 && this.status == 200) {
        let luke = JSON.parse(this.response);
        let newdata;
        for(var prop in luke) {
          newdata += prop+": "+luke[prop]+"<br>";
        }
        console.log(newdata);

        // We find the element by its ID using queryselector.
        document.querySelector("#starwars").innerHTML = newdata;
        console.log(luke);
      }
    }
    xhr.open("GET", "https://swapi.dev/api/people/1/", true);
    console.log("Opened XHR");
    xhr.send();
    console.log("xhr sent");
    }
