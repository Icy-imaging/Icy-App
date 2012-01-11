// This macro measures all the images in a folder.
// It uses the IJ.redirectErrorMessages() function,
// added in v1.43n, to prevent itself from being
// aborted if there is an error opening an image.

    requires("1.43n");
    dir = getDirectory("Choose a Directory ");
    list = getFileList(dir);
    setOption("display labels", true);
    setBatchMode(true);
    for (i=0; i<list.length; i++) {
        path = dir+list[i];
        showProgress(i, list.length);
        IJ.redirectErrorMessages();
        open(path);
        if (nImages>=1) {
            run("Measure");
            close();
        } else
            print("Error opening "+path);
    }


