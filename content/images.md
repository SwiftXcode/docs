# SwiftXcode Images

Images are pairs of Xcode templates and precompiled Swift packages 
(used by those templates).
The precompilation happens when you install a Homebrew image formula
(or manually using the GIT repo) and can take some time.
Afterwards you can create new Xcode projects using those templates,
without having to wait for the SPM bootstrap (fetch and compilation
of the dependencies).

**Important:** After installing (or uninstalling) an image, make sure to call:

```shell
swift xcode link-templates # <-- important!
```

This makes the image's Xcode templates available to Xcode.

## New Xcode Releases

If a new Xcode is released (/a new Swift version),
make sure to rebuild your images 
(e.g. using `brew reinstall swift-xcode-kitura`).

Everything will work w/o this, but you loose the convenience of having
precompiled packages at setup time.

## Creating New Images

TODO
