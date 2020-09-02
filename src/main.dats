
// this is a dummy code sample for github language inspection

// これはコンパイルできる
implement main0(): void = {
    val () = println!("Hello, world!")
}

////
// これもコンパイルできる
implement main0(): void = (
    println!("Hello, world!");
)

//// なのにこれはコンパイルできない こういうところが手触り感良くないって感じる……
implement main0(): void = (
    val dummy = 1;
    println!("Hello, world!");
)
