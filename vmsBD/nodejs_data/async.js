display = function( string) {
    return new Promise(function (resovle, reject) {
            console.log(string);
            resovle();
    });
};

// 执行顺序：b a c
fn = async function () {
    // 会造成阻塞
    await display("a");
    await display("b");
    await display("c");
    await display("d");
    await display("e");
    await display("f");
    await display("1");
    await display("2");
    await display("3");
    await display("4");
}();