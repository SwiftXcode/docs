# SwiftXcode Goals

### 1. Use Swift Package Manager directly from within Xcode

Goal (duration: a few seconds):

1. Create a project from within Xcode. (Cmd-Shift-N, follow wizard)
2. Build and run. Works.

You need to add a package? Just edit `Package.swift` and build.

State of the art (duration: some minutes or more):

1. Open terminal.
2. Call `mkdir MyProject`. Do a `cd MyProject`.
3. Call `swift package init`, `kitura init`, or something similar.
4. Call `swift package generate-xcodeproj` to create the Xcode project.
5. Open `MyProject.xcodeproj`, find and select the right scheme
6. Build and Run.

You need to add a package? Start again at step 4, sometimes 3.

### 2. Reduce Compile Time

Calling `swift build` as a tool is somewhat expensive.

Goal:
Instead of doing calling `swift build` on every build,
do a `swift build` only if the `Package.swift` changes.
Produces a static library (pretty big, bundles up all the packages),
which is directly linked against the Xcode target.

### 3. Reduce *Initial* Compile Time

State of the art:
When you create a new Swift Package Manager project,
for instance a Kitura endpoint,
the initial setup takes a long time:

1. all the required packages are resolved and fetched from the Internet
2. all those packages are built from source

For a plain Kitura HelloWorld this is about 3-5 minutes before you can get
going, even on a fast machine.

But worse: This has to be done every single time you create a new project!
Want to create HelloKitten? Another 3mins lost. HelloCow? Again.

Goals, alongside goal 1:

1. Create a project from within Xcode. (Cmd-Shift-N, follow wizard)
2. Edit your main.swift or whatever
3. Build and run. Only build your own project sources.

#### 3.1. Bonus: Do not require Internet to create new projects

Internet is only required when you install an image, once.
After that, the bundled image is available and as many projects as desired
can be created.
