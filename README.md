# Building and Embedding SwiftAutomation

by Matt Neuburg

There is a dependency on _AppleEvents.xcodeproj._ If you download the _AppleEvents_ project, and if its folder is in the same directory as the _SwiftAutomation_ folder, the SwiftAutomation project will see it and you're off to the races.

Run thru all the targets, as well as _AppleEvents,_ and check that you have your Team entered for all of those that have a Signing & Capabilities tab.

You should now be able to build the SwiftAutomation target! There may be lots of deprecations but never mind that.

Another fun thing to try: Switch to the `test` target and build and run it and watch the Console. You will see that we successfully get the mod date of a folder in the Finder.

You should now be persuaded that these frameworks are working. I will now describe what I did in order to embed them in my desktop application.

First, run thru all the targets again and check the Architectures build setting to make sure we are building for Apple Silicon. I find that we are, except for SwiftAutomationLite whose purpose I am not sure of anyway.

Now open the SwiftAutomation scheme and change the build type to Release. Now build SwiftAutomation. 

Do the same for MacOSGlues. 

Then show the product in the Finder. You will discover, among other things, in the Release folder:

* `aeglue`
* _SwiftAutomation.framework_
* _MacOSGlues.framework_
* _AppleEvents.framework_

Copy out those last three and use them. Do not bother with `aeglue`; it is, you will find, already embedded in SwiftAutomation (under _Resources/bin_).

I dragged them into my app project folder. Then I set the build phases Link Binary With Libraries and Embed Frameworks to include them.

In code, I imported SwiftAutomation and MacOSGlues and I was able to compile and run. However, in trying to _use_ these modules in my code (e.g. `Finder().name.get()`, I got errors until I turned off sandboxing, checked the sandboxing checkbox stating that I wanted to be able to send Apple Events, and (this is really important) added an Apple Events Sending Usage Description.

I then turned sandboxing back on, and added an _entitlements_ file reading as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.temporary-exception.apple-events</key>
	<array>
		<string>com.apple.finder</string>
	</array>
</dict>
</plist>
```

(And don't forget to configure your build settings to use that _entitlements_ file.) This allows me to script the Finder, which was my goal.

I thought that perhaps the _AppleEvents_ framework might not actually be needed, since I don't import it, but experimentation suggested that it was needed by _MacOSGlues_, so I just left all three frameworks embedded in my application.

Everything went swimmingly from there, until the application was finished and I wanted to archive it (so that I could notarize it). At that point, the compiler complained that it could find `Finder()`. A close look at the compile command in the Build Log suggested that this was because archiving wanted to build for Intel, whereas I had not built an Intel slice into the frameworks. So I changed the application build architectures to `arm64` only, and the problem was solved.

Finally, if you update Xcode so that it contains a new version of the compiler, the application project might refuse to compile, on the grounds that the frameworks were built with an older version of the compiler. However, that's no big deal; you just build the frameworks again and replace them in the app project folder with the newly built versions.

(That's it! What follows is the original README from the upstream source, namely Hamish Sanderson's distribution.)

----

# SwiftAutomation README

## About

SwiftAutomation is an Apple event bridge that allows Apple's Swift language to control "AppleScriptable" macOS applications directly. For example:

```swift
// tell application "iTunes" to play
try ITunes().play()

// tell application "Finder" to set fileNames to name of every file of home
let fileNames = try Finder().home.files.name.get() as [String]

// tell application "TextEdit" to make new document ¬
//                                     with properties {text:"Hello World!"}
try TextEdit().make(new: TED.document, 
                    withProperties: [TED.text: "Hello World!"])
```


The SwiftAutomation framework defines the basic functionality for constructing object specifiers, converting data between Swift and AE types, and sending Apple events to running applications. Generated Swift files supply the glue code for controlling individual applications using human-readable terminology.


## Get it

To clone the Xcode project to your own machine:

`git clone https://github.com/hhas/SwiftAutomation.git`

A basic Swift "script editor" (currently under development) is also available:

https://github.com/hhas/swiftautoedit


## Install it

To embed SwiftAutomation for use in Swift-based GUI apps see Xcode's Workspace documentation.

To use SwiftAutomation in Swift "scripting", see the Installing SwiftAutomation chapter of the SwiftAutomation documentation. Until Swift provides a stable ABI some manual set-up is required.


## Try it

To run simple examples (see test/main.swift), build and run the `test` target.

Additional glues can be generated by building the `aeglue` target and running the resulting `aeglue` command line tool in Terminal. For example, to generate a Swift glue and accompanying documentation for macOS's Photos application:

`/path/to/aeglue -o ~/Desktop Photos`

Note that `aeglue` normally retrieves application terminology using `ascrgdte` ('get dynamic terminology') Apple events. Some applications (e.g. Finder) have faulty `ascrgdte` handlers that fail to return correct terminology, in which case use the `-s` or 'Use SDEF terminology' options instead. (Be aware that SDEF-based terminology may also contain bugs and omissions, in which case use raw four-char codes or correct generated glue code by hand.)

SwiftAutomation requires macOS 10.11 and Swift 3.0 and Xcode 8.0 or later.


## Status

The code is complete except for testing and bug fixes. The documentation lacks a usable tutorial chapter. Given current uncertainty regarding the future of Apple event-based automation the project is on hiatus until WWDC17, after which a final decision on its future can be made.


## Known issues

When using SwiftAutomation within an interactive playground, be aware that Xcode automatically re-runs ALL code within a playground whenever a line of code is modified, causing ALL application commands to be re-sent. This is not a problem when using non-mutating application commands such as `get` and `count`; however, take care when using commands that modify the application's state - `make`, `move`, `delete`, etc. - within a playground as sending these more than once may have unintended/undesirable results. This is a playground issue that affects ALL non-idempotent and/or unsafe function calls, not just application commands.

## Etc.

SwiftAutomation is released into the public domain.

No warranty given, E&OE, use at own risk, etc.

