// This example script opens images 10-20 of a TIFF stack.
// It requires ImageJ 1.44o or later.

  td = new TiffDecoder(directory, name);
  fi = td.getTiffInfo();
  vs = new FileInfoVirtualStack(fi[0], false);
  stack = new ImageStack(vs.getWidth(), vs.getHeight());
  for (i=10; i<=20; i++)
      stack.addSlice(vs.getSliceLabel(i), vs.getProcessor(i));
  new ImagePlus("stack(10-20)", stack).show();
