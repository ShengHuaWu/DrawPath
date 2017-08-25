## Declarative Programming in Swift
Recently, a series of articles --- [Building a declarative animation framework in Swift](https://www.swiftbysundell.com/posts/building-a-declarative-animation-framework-in-swift-part-1) catches my eye. [John](https://twitter.com/johnsundell) points out a problem with implementing the animation in iOS, which is the more steps we add into our animation the more complex and hard to read our code becomes. Therefore, he creates a declarative way to deal with the animation, and it really makes our code more concise and readable. If you haven't read those articles, I highly recommend you should visit it.

### Why Declarative Programming
As developers, not only do we focus on implementing workable features, but also attempt to increase the maintenance of our code.
In order to keep the code robust, it is vital to retain a high-level of expressiveness during programming.
It is said that declarative programming can be used to achieve our goal because one of its basic concepts is describing the intentions of developers.
Furthermore, if we write our code with a declarative way, we are going to obtain really great separation of concerns and therefore the testability will be brought.
Overall, declarative programming is a helpful thought and it is worthwhile to give a try.

### Notes
1. Readable, concise, expressiveness
2. What to do v.s. How to do it
3. Describe intentions
4. Idempotent
5. Concurrent
6. Stateless
7. Separation of concerns
8. Testability

### Reference
* [Swift 3 and Declarative Programming](https://possiblemobile.com/2016/09/swift-3-declarative-programming/)
* [Declarative API Design in Swift](http://blog.benjamin-encz.de/post/declarative-api-design-in-swift/)
* [Introduction to Functional Programming in Swift](https://www.raywenderlich.com/114456/introduction-functional-programming-swift)
* [A Declarative Architecture for Swift Apps](https://spin.atomicobject.com/2016/04/20/declarative-swift-architecture/)
* [The Unreasonable Effectiveness of Declarative Code](https://www.skilled.io/u/swiftsummit/declarative-code)
