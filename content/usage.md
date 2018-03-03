# Usage

## Using it for iOS Projects

Here is the basic version:

1. Create new Project in Xcode (File Menu / New / Project)
2. Select iOS / Swift Package Manager App
3. Give it a name, optionally preconfigure SPM modules you want
4. Build project (can take a moment w/o an image)
5. In Package.swift, add modules as you wish, e.g. `cows`
6. in AppDelegate.swift, `import cows`, do `print(cows.vaca())`
7. Build project and run

## Manual Setup

The functionality can be added to any existing project,
there is no requirement to use the templates.

Steps:
- Create a `Package.swift` in your project,
  DO NOT ADD it to the Xcode target
- Add an Xcode shell buildstep to your target, put it at the very top.
  Within that, invoke `swift xcode build`
  (optionally prefixed by an `SPM_IMAGE=ImageYouWantToUse`)
- Add some build settings (either in Xcode or in an xcconfig file):
  - "Header Search Paths" / `HEADER_SEARCH_PATHS`
    - `$(SRCROOT)/$(PRODUCT_NAME)/.buildzz/.build/Xcode/$(PLATFORM_PREFERRED_ARCH)-apple-$(SWIFT_PLATFORM_TARGET_PREFIX)$($(DEPLOYMENT_TARGET_SETTING_NAME))/$(CONFIGURATION)`
  - "Import Paths" (Swift) / `SWIFT_INCLUDE_PATHS`
    - `$(SRCROOT)/$(PRODUCT_NAME)/.buildzz/.build/$(PLATFORM_PREFERRED_ARCH)-apple-$(SWIFT_PLATFORM_TARGET_PREFIX)$($(DEPLOYMENT_TARGET_SETTING_NAME))/$(CONFIGURATION)`
  - "Library Search Paths" / `LIBRARY_SEARCH_PATHS`
    - `$(SRCROOT)/$(PRODUCT_NAME)/.buildzz/.build/Xcode/$(PLATFORM_PREFERRED_ARCH)-apple-$(SWIFT_PLATFORM_TARGET_PREFIX)$($(DEPLOYMENT_TARGET_SETTING_NAME))/$(CONFIGURATION)`
  - "Other Linker Flags" / `OTHER_LDFLAGS`
    - `-lXcodeSPMDependencies`

If you do this a lot and you don't want to use the templates,
create an `xcconfig` file to carry the settings,
and just add that to your project.
We also provide an xcconfig you can use/include:
`/usr/local/lib/xcconfig/swift-xcode.xcconfig`.
