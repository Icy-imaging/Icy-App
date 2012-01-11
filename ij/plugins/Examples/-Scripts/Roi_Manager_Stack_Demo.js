// This is a JavaScript version of the macro at
// http://rsb.info.nih.gov/ij/macros/ROI_Manager_Stack_Demo.txt

  batchMode = true;  // don't display ROI Manager
  if (batchMode)
      rm = new RoiManager(true); 
  else {
     rm = RoiManager.getInstance();
     if (rm==null) rm = new RoiManager(); 
  }
  rm.runCommand("reset");
  imp = IJ.createImage("Test Stack", "8-bit black", 500, 500, 100);
  imp.show();
  nSlices = imp.getStackSize();
  for (i=1; i<=nSlices; i++) {
      imp.setSlice(i);
      roi = new OvalRoi(i*2, i*2, i*4, i*4);
       rm.addRoi(roi);
      ip = imp.getProcessor();
      ip.setValue(i+99);
      ip.fill();
  }
  n = rm.getCount();
  for (i=0; i<n; i++) {
      rm.select(imp, i);
      IJ.run(imp, "Measure", "");   
  }
  //rm.runCommand("Show All");
