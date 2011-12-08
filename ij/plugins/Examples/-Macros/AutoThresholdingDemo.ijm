// This macro demonstrates how to use the
// getList("threshold.methods") and setAutoThreshold(string)
// functions that were added in ImageJ 1.42p.
// A JavaScript version of this macro is available at
//   http://rsb.info.nih.gov/ij/macros/js/AutoThresholdingDemo.js

  requires("1.42p");
  run("M51 Galaxy (177K, 16-bits)");
  methods = getList("threshold.methods");
  title = getTitle;
  for (i=0; i<methods.length; i++) {
     showProgress(i, methods.length);
     showStatus((i+1)+"/"+methods.length+": "+methods[i]);
     setAutoThreshold(methods[i]+" dark");
     getThreshold(lower, upper);
     rename(methods[i]+": "+lower+"-"+upper);
     wait(2000);
  }
  rename(title);
