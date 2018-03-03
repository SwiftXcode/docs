# SwiftXcode Installation

```shell
brew tap swiftxcode/swiftxcode
brew install swift-xcode
swift xcode link-templates # <-- important!
```

### Extra Images

Images are pairs of Xcode templates and precompiled Swift packages 
(used by those templates).
The precompilation happens when you install a Homebrew image formula
(or manually using the GIT repo) and can take some time.
Afterwards you can create new Xcode projects using those templates,
without having to wait for the SPM bootstrap (fetch and compilation
of the dependencies).

#### Image: Kitura

(One time) compile time: ~5 minutes. Image size: ~100MB.
Fresh project setup from create to run: 3 seconds.

```shell
brew install swift-xcode-kitura
swift xcode link-templates # <-- important!
```

## Troubleshooting

If something isn't working in a Homebrew setup, check whether:

    brew doctor

outputs anything unusual.

If you need any help, feel free to ask on the
[Mailing List](https://groups.google.com/d/forum/apacheexpress)
or our
[Slack channel](http://slack.noze.io).
