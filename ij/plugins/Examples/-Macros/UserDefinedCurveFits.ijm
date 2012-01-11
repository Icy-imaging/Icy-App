// This macro demonstrates how to fit a user-defined 
// equation to a set of data points. The equation is
// defined as macro code that assigns a value to the
// variable 'y' dependent on the variable 'x' and up
// to 5 parameters ('a','b','c','d' and 'e').

  requires("1.42f");
  x= newArray(0,1,2,3,4,5);
  y = newArray(0,0.9,4.5,8,18,24);

  // Exponential fit, default initial
  // guesses (a=1, b=1)
  Fit.doFit("y = a*exp(b*x)", x, y);
  Fit.plot;

  // Rodbard fit
  RodbardEquation = "y = d+(a-d)/(1+pow((x/c),b))";
  initialGuesses = newArray(0, 1, 2, 5, 24);
  //Fit.showDialog; // display simplex settings dialog
  Fit.logResults;
  Fit.doFit(RodbardEquation, x, y, initialGuesses);
  Fit.plot;
